import UIKit

// 도형 클래스
class Shape {
    var numberOfSides : Int?

    init(numberOfSides : Int?){
        self.numberOfSides = numberOfSides
    }
    
    func description() -> String{
        if let numberOfSides = self.numberOfSides{
            return "\(numberOfSides)변을 갖는 도형"
        }
        else{
            return "도형"
        }
    }
}

// 사각형 클래스
class Rect : Shape {
    var width : Int
    var height : Int
    
    init(width : Int, height : Int){
        self.width = width
        self.height = height
        super.init(numberOfSides : 4)
    }
    
    override func description() -> String{
        if let numberOfSides = self.numberOfSides{
            if(numberOfSides == 4){
                return "\(numberOfSides)변을 갖는 도형(폭->\(self.width), 높이->\(self.height)의 사각형)"
            }
            else {
                return "\(numberOfSides)변을 갖는 도형"
            }
        }
        else{
            return "도형"
        }
    }
    
    func area()->Int{
        return width * height
    }
    
    
}

let shape1 = Shape(numberOfSides: nil)          // numberOfSides는 변의 갯수, 사각형인 경우 4, 삼각형은 3, Int? 타입
print(shape1.description())
let shape2 = Shape(numberOfSides: 3)
print(shape2.description())
let rect1 = Rect(width: 20, height: 30)         // 폭(width)과 높이(height), Int 타입
print(rect1.description())                      // Rect 클래스에서 Shape 클래스의 description 메소드 재정의
let rect2: Rect? = Rect(width: 30, height: 40)
print((rect2?.description())!)
let area2 = rect2?.area()
print("면적: \(area2!)")

