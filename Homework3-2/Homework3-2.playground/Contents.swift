import UIKit

var names: [String] = ["김풍상", "박화상", "고진상", "조정상", "이외상"]
var scores: [Int]? = [69, 38, 75, 61, 45]


var i: Int = 0
var total_score : Int = 0

print("합격자 명단")

while i < (scores?.count)!{
    if ((scores?[i])!) >= 60{
        print("\(names[i]) \((scores![i]))점")
    }
    total_score = total_score + (scores?[i])!
    i = i+1
}

print("총 점수: \(total_score)점")
