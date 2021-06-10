
import UIKit
import Alamofire

class LoginController: UIViewController {
    @IBOutlet var idField: UITextField! // 벗겨진 채로 선언됨
    @IBOutlet var passwdField: UITextField! // 벗겨진 채로 선언됨

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(_ sender: Any) {
        guard let id = idField.text, let passwd = passwdField.text else {
            return
        }
        let urlString = "http://203.252.219.241:8080/FinalProject/loginPro.jsp" +
            "?id=" + id + "&passwd=" + passwd // get 방식이기 때문에 id와 pw 붙임
        let encodedUrlStr = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) // 인코딩 해줌
        guard let encodedUrlString = encodedUrlStr else {
            return
        }
        AF.request(encodedUrlString).responseString(encoding: .utf8) { response in // AF의 request객체를 호출 -> responseString 메소드 호출
            switch response.result {
            case .success(var str): // success이 경우에
                str = str.trimmingCharacters(in: .whitespaces) // 서버가 보낸 문자열이 긴 경우 문자열에 끼어있을 수 있는 whitespace(tab, space 등..)제거하여 str변수에 저장
                if str.contains("0") || str.contains("-1") { // str이 0이거나 -1일 경우
                    self.idField.text = "Try Again!"
                    self.passwdField.text = ""
                } else { // 그 외의 경우 (str이 1일 경우)
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil) // 전체를 관장하는 스토리보드 객체 생성
                    // 스토리보드 객체한테 너한테 정의된 ScheduleController의 객체를 생성해서 가지고 들어올려고 하는데 id가 Schedule이라고 하는 애를 생성해줘!라고 함
                    // ScheduleController형으로 변환하여 scheduleController 변수에 저장
                    let scheduleController = storyBoard.instantiateViewController(withIdentifier: "Schedule") as! ScheduleController
                    // logintController객체가 스토리보드 객체를 통해서 scheduleController 객체르 생성할려고 하는데 자신이 갖고 있는 back pointer를 통해서 네비게이션 객체에게 내가 지금 생성한 이 객체를 푸쉬해줘! 라고 함
                    // 만들어진 scheduleController가 navigationController의 family가 되면서 amitation과 함께 무대에 나타남
                    self.navigationController?.pushViewController(scheduleController, animated: true)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
