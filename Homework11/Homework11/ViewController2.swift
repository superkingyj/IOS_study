//
//  ViewController2.swift
//  Homework10
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/05/08.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet var youLabel: UILabel!
    @IBOutlet var meLabel: UILabel!
    @IBOutlet var youNameField: UILabel!
    var youName_ : String?
    var meScore : Int = 0
    var youScore : Int = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tempController = segue.destination as? ViewController3 else {
            return
        }
        tempController.meScore = meScore
        tempController.youScore = youScore
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("eum")
            
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("doo")
        if let youName = youName_ {
            if youName != ""{
                youNameField.text = youName

            }
            else {
                youNameField.text = "You"
            }
        }
        else{
            youNameField.text = "You"
        }
        
        var cards : [Card] = []
        var youLabelText : [String] = []
        var meLabelText : [String] = []
        youScore = 0
        meScore = 0
        
        for i in 1...4{
            for j in 1...13{
                if let s = Suit(rawValue: i),
                   let r = Rank(rawValue: j){
                    cards.append(Card(suit: s, rank: r))
                }
            }
        }
        
        cards.shuffle()
        
        for i in 0..<5 {
            cards[i].flip()
            youLabelText.append(cards[i].description())
            youScore += (cards[i].suit.rawValue * cards[i].rank.rawValue)
        }
        for i in 5..<10{
            cards[i].flip()
            meLabelText.append(cards[i].description())
            meScore += cards[i].suit.rawValue * cards[i].rank.rawValue
        }

        youLabel.text = youLabelText[0] + "\n" + youLabelText[1] + "\n" + youLabelText[2] + "\n" + youLabelText[3] + "\n" + youLabelText[4] + "\n"
        meLabel.text = meLabelText[0] + "\n" + meLabelText[1] + "\n" + meLabelText[2] + "\n" + meLabelText[3] + "\n" + meLabelText[4] + "\n"
        
        youLabel.resignFirstResponder()
        meLabel.resignFirstResponder()

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("hun")
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
