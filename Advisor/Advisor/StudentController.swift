
import UIKit
import Kanna // 돔 객체에서 원하는 데이터를 파싱할 때 사용하는 라이브러리
import Alamofire // http 통신을 할때 사용하는 라이브러리

class StudentController: UITableViewController {
    var advisorName: String? // 넘겨받은 교수 이름을 받을 변수
    var studentArray: [String] = [] // 해당 지도교수의 학생들 이름을 받을 배열 변수
    
    func getStudents() -> Void {
        guard let advisor = advisorName else { // 교수 이름을 잘 받았는지 확인함. Advisor로 받아옴.
            return // 못받았으면 바로 리턴.
        }
        let urlString = "http://203.252.219.241:8080/FinalProject/advisorPro.jsp" + "?advisor=" + advisor // url에 아까 입력받은 교수명 붙임
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) // 한글이 포함되어 percnetencoding 함
        guard let encodedUrlStr = encodedUrlString else {
            return
        }
        // Alamofire 사용
        // request 메소드(static 메소드 - 객체 생성 없이 클래스 이름만으로도 호출 가능한 메소드) 인코딩 값 주면서 호출하여 request 객체 생성
        AF.request(encodedUrlStr).responseString(encoding: .utf8) { response in // 클로저
            switch response.result { // response 객체의 result를 조사
            case .success(let str): // success일 경우 연관값을 str로 받겠다 (str이 서버가 보낸 스트링)
                self.parseHTML(htmlStr: str) // parseHTML함수 호출하여 파싱
            case .failure(let error): // failure일 경우 연관값을 error로 받겠다
                print(error) // error 출력
            }
        }
    }
    
    func parseHTML(htmlStr string: String) -> Void { // "<h5>이름</h5><h5>이름</h5><h5>이름</h5><h5>이름</h5>.. " 이런 스트링
        let document = try? Kanna.HTML(html: string, encoding: .utf8) // 칸나의 html 메소드 호출. 스트링 값 지정, 인코딩 지정. exception 던질 수 있음. try? 쓰면 에러 생길 경우 전체 nil 처리. 반환값은 nil아니면 dom객체. 성곡시 dom객체 document 변수에 저장
        guard let doc = document else {
            return
        }
        for node in doc.xpath("//h5") { // xpath라는 메소드를 호출. h5 node들 배열로 반환.
            if let text = node.text {
                studentArray.append(text)
                print(text)
            }
        }
        
        // 중요!!!!!!!!!!!!!!
        self.tableView.reloadData() // Main thread가 준비한 테이블 뷰에 numberOfSections tableView tableView 호출하여 파싱한 데이터 채워넣기.
    }
    
    // 뷰가 다 완성이 된 상황에 호출됨
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 통신하기, 끌어온 데이터를 파싱하기 두 작업을 해야하는 함수 getStudent()를 호출
        // 네트워크 통신은 Main thread에서 할 수 없음. thread 분리. 병렬 처리
        self.getStudents()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = studentArray[indexPath.row]
        return cell
    }

}
