//
//  ViewController.swift
//  Movie
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/05/22.
//

import UIKit

//class ViewController: UIViewController, UITextFieldDelegate { // ,로 여러개 상속받을 스타일을 지정할 수 있음
class ViewController: UIViewController{
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameField.delegate = self // 텍스트 필드의 조력자를 자기 자신으로 설정하는 것.
    }

    @IBAction func register(_ sender: Any) {
        self.nameField.resignFirstResponder() // 첫번째 키보드 내려기
                let text = nameField.text // nameField의 텍스트 가져오기
                if text!.isEmpty { // 입력을 안한다 하더라도 ""가 오기 때문에 상관 없음. 이름 입력할경우 "감유진"이 넘어옴
                    welcomeLabel.text = "Enter name, please~" // 빈 문자열이면 welcomeLabel에 이 문자열이 표시됨
                } else { // 만약 이름이 있다면
                    welcomeLabel.text = "\(text!) is registered!" // welcomeLabel에 이 문자열이 표시됨
//                    let naviController = self.tabBarController?.viewControllers?[1] as? UINavigationController // 원래코드. 탭바컨트롤러 -> 뷰컨트롤러즈 -> 네비게이션 컨트롤러 -> 스택에 가서 0번에 접근해서 주소값을 가져와서 접근. 배열에나 스택에 들어가는 형은 UINavigationController으로 변환해야 해서 as연산자 사용. nill 아니면 네비게이션 컨트롤러즈의 값
                    // 수정
                    let naviController = self.tabBarController?.viewControllers?[0] as? UINavigationController // 나는 세그웨이 순서를 바꿨기 때문에 수정함.
                    let controller = naviController?.viewControllers[0] as? MoiveController // 스택 0번째에 접근하면 테이블 뷰 컨트롤러의 주소값 xx 반환. MovieController에서 만들어진 애라서 다운캐스팅함
                    controller?.nameString = nameField.text // 테이블 뷰 컨트롤러의 nameString에다가 이름 전달
                }
        }
}

extension ViewController: UITextFieldDelegate { // ViewController를 UITextFieldDelegate를 준수하는 성격으로 확장하기

    func textFieldDidBeginEditing(_ textField: UITextField) { // 사용자가 이 텍스트 필드를 수정하기 시작할 때
        self.nameField.backgroundColor = UIColor.green // 네임필드의 백그라운드를 초록색으로 바꾸기
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool { // 사용자가 이 텍스트 필드 수정을 완료하면
        textField.backgroundColor = UIColor.lightGray // 네임필드의 백그라운드를 회색으로 바꾸기 (키보드가 내려간 순간 호출됨)
        return true;
    }
}
