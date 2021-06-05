import UIKit

var scores: [String:Int?] = ["김풍상":69, "박화상":0, "고진상":75, "조정상":nil, "이외상":45]
var totalScore = 0
var count: Int?
count = 0 // 응시자수
print(scores)

var pass_info : [String:Int] = [:]
var unwrp_count : Int = 0

if let count = count {
    unwrp_count = count
}

for (name, score) in scores{
    guard let _ = score else{
        print("\(name): 결시")
        continue
    }
    if let score = score{
        print("\(name): \(score)")
        totalScore = totalScore + score
        unwrp_count = unwrp_count + 1
        if score >= 60{
            pass_info[name] = score
        }
    }
    
}

print("합격자 명단")
for (name, score) in pass_info {
    print("\(name) \(score)점")
}

print("응시자 총 점수: \(totalScore)점")
print("응시자 평균 점수: \(Float(totalScore)/Float(unwrp_count))")

