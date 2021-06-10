
import UIKit
import Kanna
import Alamofire

class ScheduleController: UITableViewController {
    var scheduleItem: [String] = [] // 타이틀을 담을 배열
    var scheduleDate: [String] = [] // 날짜를 담을 배열

    func getSchedule() -> Void {
        let urlString = "http://www.duksung.ac.kr/"
        AF.request(urlString).responseString(encoding: .utf8) { response in
            switch response.result { // 응답 문자열을 갖고 뭘하나면
            case .success(let htmlStr): //
                self.parseHTML(str: htmlStr) // parseHTML함수에 응답 문자열 넘겨줌
            case .failure(let error):
                print(error)
            }
        }
    }

    func parseHTML(str: String) -> Void { // 응답 문자열 넘겨받고
        let document = try? Kanna.HTML(html: str, encoding: .utf8) // 돔객체 생성
        guard let doc = document else { // 실패하면
            return // 바로 리턴
        }
        for item in doc.xpath("//p[@class='con']") { // 돔객체에서 파싱 할 xpath를 뽑으면 앨리먼트 배열을 넘겨받고 (타이틀)
            if let text = item.text { // 하나씩 접근하여
                scheduleItem.append(text) // scheduleItem 배열에 text 저장
            }
        }
        for date in doc.xpath("//p[@class='date']") { // 돔객체에서 파싱 할 xpath를 뽑으면 앨리먼트 배열을 넘겨받고 (날짜)
            if let text = date.text { // 하나씩 접근하여
                scheduleDate.append(text)
            }
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getSchedule()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleItem.count // 섹션에 몇개의 셀을 준비해야하는지 scheduleItem.count로 넘겨줌
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = scheduleItem[indexPath.row] // textLabel에는 scheduleItem에서 하나씩 뽑아서 입힘
        cell.detailTextLabel?.text = scheduleDate[indexPath.row] // detailTextLabel에는 scheduleDate에서 하나씩 뽑아서 입힘
        return cell
    }
}
