import UIKit

for i in 1...3 {
    let cal = selectCalc(index: i)
    if let cal = cal {
        let result = cal(10, 20)
        print("calculation result: \(result)")
    }
}

// 클로저를 반환하는 selectCalc 함수 정의, 덧셈과 뺄셈만 지원
// 함수는 클로저의 특수형태, 따라서 내부 함수를 사용하지 않음
// selectCalc 함수의 반환 타입이 클로저의 옵셔널 타입인 것에 주의
func selectCalc(index: Int) -> ((Int, Int) -> Int)? {
    if index == 1{
        return {
            print("add calculator selected")
            return $0 + $1
        }
    }
    else if index == 2{
        return{
            print("sub calculator selected")
            return $0 - $1
        }
    }
    else{
        print("no calculator selected")
        return nil
    }
}

