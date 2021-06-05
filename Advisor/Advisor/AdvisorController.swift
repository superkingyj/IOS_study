
import UIKit

class AdvisorController: UITableViewController {
    let advisorArray = ["정원호","음두헌","강남희","임양미","박태정"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { //섹션 몇개야? -> 1대답
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 위에 있는 배열의 개수 반환(지금은 5)
        return advisorArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvisorCell", for: indexPath) // cell 객체 얻어내기 (Prototype cell의 id와 일치해야함. 지금은 AdvisorCell)
        // Configure the cell...
        cell.textLabel?.text = advisorArray[indexPath.row] // 배열에 각 교수의 이름을 텍스트 레이블에 입혀서 5개 반환
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // 사용자가 cell을 터치했을 경우
        guard let destController = segue.destination as? StudentController else { // destination을 StudentController 형태로 변환해서 반환
            return
        }
        let index = tableView.indexPathForSelectedRow?.row // 이미 바인딩 된 컨트롤러를 사용. 몇번째 셀을 터치했는지 가져옴.
        destController.advisorName = advisorArray[index!] // 인덱스에 해당하는 cell에 있는 교수의 이름을 destination contoller에 넘겨줌. 위험한 코드니까 바인딩 해서 쓰기
    }
}
