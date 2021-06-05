import UIKit

var scores = ["김풍상":69, "박화상":38, "고진상":75, "조정상":61, "이외상":45]

var totalScore = 0

var passStudent = [String:Int]()
   
for (name, score) in scores{
    if score >= 60{
        passStudent[name] = score
    }
    totalScore = totalScore + score
}

print("합격자 명단")
for (name, score) in passStudent{
    print(name + " \(score)점")
}
print("총 점수: \(totalScore)점")

scores["총점"] = totalScore
print(scores)
