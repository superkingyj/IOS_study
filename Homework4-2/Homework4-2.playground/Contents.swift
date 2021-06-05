// 박화상 0점, 조정상 결시
import UIKit

let names: [String] = ["김풍상", "박화상", "고진상", "조정상", "이외상", "박내상"]
let scores: [Int?] = [69, 0, 75, nil, 45, 55]

listPass(names: names, scores: scores, condition: { score in score >= 50 })
listPass(names: names, scores: scores) { score in score >= 60 }
listPass(names: names, scores: scores) { $0 >= 70 }

// listPass 함수 정의
// 세번째 파라미터는 클로저, 점수가 50점/60점/70점 이상인 경우 true 반환
func listPass(names: [String], scores: [Int?], condition: (Int) -> Bool) {
    print("** 합격자 명단 **")
    for i in 0..<names.count{
        if let score = scores[i]{
            if condition(score){
                print("\(names[i]) \(score)")
            }
        }
    }
}

// 배열의 compactMap 메소드는 배열의 nil 값을 모두 제거하고
// 나머지 옵셔널 원소를 모두 일반 원소로 구성한 배열을 반환
let scoresWithNoOptionals = scores.compactMap { $0 }
print("------------------")
// 배열의 메소드만 사용해서 응시자의 총 점수와 평균을 구함

print("응시자 총 점수 : \(scoresWithNoOptionals.reduce(0){$0 + $1})")
print("응시자 평균 점수 : \(Float(scoresWithNoOptionals.reduce(0){$0 + $1})/Float(scoresWithNoOptionals.count))")
