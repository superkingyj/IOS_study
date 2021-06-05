//
//  ViewController3.swift
//  Homework11
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/05/16.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet var winLooseLabel: UILabel!
    var meScore : Int?
    var youScore : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if meScore! > youScore! {
            winLooseLabel.text = "You Loose!"

        }
        else {
            winLooseLabel.text = "You Win!"
        }
        let alertController = UIAlertController(title: "One more time?",
                        message: "Your Score : \(youScore!) / My Score : \(meScore!)",
                        preferredStyle: UIAlertController.Style.actionSheet)

        alertController.addAction(UIAlertAction(title: "No", style: .cancel))
        
        let alertAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { action in
                                            self.navigationController?.popViewController(animated: true)} )
        alertController.addAction(alertAction)
            
        self.present(alertController, animated: true)
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
