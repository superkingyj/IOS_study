import UIKit

let names : [String] = ["김풍상", "박화상", "고진상", "조정상", "이외상"]
let scores : [Int?] = [69, 0, 75, nil, 45]
var count = 0

var pass_name : [String] = [] // 합격한 사람의 이름 목록
var pass_score : [Int] = [] // 합격한 사람의 점수 목록
var pass_count : Int = 0 // 합격한 사람 수
var total_score : Int = 0 //응시자 총 점수

for i in 0..<5{
    if let score = scores[i] {
        count = count + 1
        total_score = total_score + score
        if score >= 60 {
            pass_score.append(score)
            pass_name.append(names[i])
            pass_count = pass_count + 1
        }
    }
}

print("합격자 명단")

for i in 0..<pass_count{
    print("\(pass_name[i]) \(pass_score[i])점")
}

print("응시자 총 점수: \(total_score)점")
print("응시자 평균 점수: \(Float(total_score)/Float(count))")
