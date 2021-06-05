//
//  ViewController.swift
//  Homework12
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/05/22.
//

import UIKit

class ViewController: UIViewController {

    var mealString : String?
    @IBOutlet var mealField: UILabel!
    @IBOutlet var tableField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableField.delegate = self
        tableField.backgroundColor = UIColor.green
        
        if let mealString_ = mealString {
            mealField.text = mealString_
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let mealString_ = mealString {
            mealField.text = mealString_
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        mealField.becomeFirstResponder()
        mealField.text = ""
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let _ = mealString else {
            return true;
        }
        mealField.text = "table \(tableField.text!) ordered \(mealString!)"
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.mealField.resignFirstResponder()
    }
}
