//
//  LoginController.swift
//  Homework15
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/06/09.
//

import UIKit
import Alamofire

class LoginController: UIViewController {
    @IBOutlet var idField: UITextField!
    @IBOutlet var passwdField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func login(_ sender: Any) {
        guard let id = idField.text, let passwd = passwdField.text else {
            return
        }
        print("id:" + idField.text!)
        print("pw:" + passwdField.text!)
        let urlString = "http://203.252.219.241:8080/FinalProject/loginPro.jsp" +
            "?id=" + id + "&passwd=" + passwd // get 방식이기 때문에 id와 pw 붙임
        let encodedUrlStr = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let encodedUrlString = encodedUrlStr else {
            return
        }
        AF.request(encodedUrlString).responseString(encoding: .utf8) { response in
            switch response.result {
            case .success(var str):
                str = str.trimmingCharacters(in: .whitespaces)
                if str.contains("0") || str.contains("-1") { // str이 0이거나 -1일 경우
                    self.showAlert()
                } else {
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let scheduleController = storyBoard.instantiateViewController(withIdentifier: "MovieRank") as! MovieRankController
                    self.navigationController?.pushViewController(scheduleController, animated: true)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "로그인 실패",
                        message: "다시 입력하세요~", preferredStyle: UIAlertController.Style.actionSheet)
        let alertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
