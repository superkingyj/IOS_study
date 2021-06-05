import UIKit

let names = ["김풍상", "박화상", "고진상", "조정상", "이외상"]
let scores = [69, 38, 75, 61, 45]

var totalScore = 0
var i = 0

var passName = [String]()
var passScore = [Int]()

for i in 0..<5 {
    if scores[i] >= 60 {
        passName.append(names[i])
        passScore.append(scores[i])
    }
    totalScore = totalScore + scores[i]
}

print("합격자 명단")

for i in 0..<3 {
    print(passName[i] + " \(passScore[i])점")
}
print("총 점수 : \(totalScore)점")

