//
//  ViewController.swift
//  Homework10
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/05/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var name: UITextField!
    @IBOutlet var welcome: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tempController = segue.destination as? ViewController2 else {
            return
        }
        tempController.youName_ = name.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func useName(_ sender: Any) {
        
        let name_ = name.text
        
        if name_ != nil{
            if name_ != ""{
                welcome.text = "Welcome \(name_!)!!"
                welcome.resignFirstResponder()
            }
            else{
                welcome.text = "Enter name please!"
                welcome.resignFirstResponder()
            }
        }
        else {
            welcome.text = "Enter name please!"
            welcome.resignFirstResponder()
        }
        
    }
    


}

