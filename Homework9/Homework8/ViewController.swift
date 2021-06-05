//
//  ViewController.swift
//  Homework8
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/04/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var gradeField: UITextField!
    @IBOutlet var ageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convert(_ sender: Any) {
        
        var name_ : String
        var grade_ : String
        
        if let name = nameField.text {
            if name == ""{
                gradeField.text = "name을 입력하세요"
                gradeField.resignFirstResponder()
                return
            }
            else{
                name_ = name
            }
        }
        else{
            gradeField.text = "name을 입력하세요"
            gradeField.resignFirstResponder()
            return
        }
        
        if let age = Int(ageField.text!){
            
            switch age{
            case 8..<14 :
                grade_ = "초딩"
                break
            case 14..<17 :
                grade_ = "중딩"
                break
            case 17..<20 :
                grade_ = "고딩"
                break
            default:
                grade_ = "기타"}
        }
        else{
            gradeField.text = "age를 입력하세요"
            gradeField.resignFirstResponder()
            return
        }

        gradeField.text = "\(name_)님은 \(grade_)입니다."
        gradeField.resignFirstResponder()
    }
    
    @IBAction func comeback(segue : UIStoryboardSegue){
    
    }
    
    

}

