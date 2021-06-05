//
//  ViewController.swift
//  Converter
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/04/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var ageField: UITextField!
    @IBOutlet var gradeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convert(_ sender: Any) {
                
        let name_ = nameField.text
        let age_ = Int(ageField.text!)
        
        guard let name = name_ else{
            gradeField.text = "이름을 입력하세요"
            return
        }
        guard let age = age_ else{
            gradeField.text = "나이를 입력하세요"
            return
        }
    
        var grade = ""
        switch age{
        case 8..<14 :
            grade = "초딩"
            break
        case 14..<17 :
            grade = "중딩"
            break
        case 17..<20 :
            grade = "고딩"
            break
        default:
            grade = "기차"
        }
        
        gradeField.text = "\(name)님은 \(grade)입니다."
        gradeField.resignFirstResponder()
        
    }
    
}

