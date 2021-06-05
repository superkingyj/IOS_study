import UIKit

// 도형 프로토콜
protocol Shape {
    var numberOfSides: Int? { get set }
    var area: Double { get }
    func description() -> String
}

// Rect(사각형) 클래스 - Shape 프로토콜 준수
// width: Double, height: Double - stored property
// perimeter: Double, area: Double - computed property
class Rect : Shape {
    var width : Double
    var height : Double
    var perimeter : Double
    var area: Double {
        get{
            return width * height
        }
    }
    var numberOfSides: Int? {
        get{
            return 4
        }
        set{
            
        }
    }

    init(width: Double, height: Double){
        self.width = width
        self.height = height
        self.perimeter = self.width*2 + self.height*2
    }
    
    func description() -> String {
        return ("폭 \(width), 높이 \(height)인 사각형")
    }
}

// Circle(원) 클래스 - Shape 프로토콜 준수
// radius: Double - stored property
// curcumference: Double, area: Double - computed property
class Circle : Shape {
    var radius : Double
    var curcumference : Double
    var area: Double{
        get{
            return radius*radius*Double.pi
        }
    }
    var numberOfSides: Int? {
        get{
            return 0
        }
        set{
            
        }
    }
    
    init(radius: Double){
        self.radius = radius
        self.curcumference = 2*Double.pi*radius
    }
    
    func description() -> String {
        return ("반지름이 \(radius)인 원")
    }
   
}

// 도형 배열
var shapeArray: [Shape] = []
let rect = Rect(width: 20.5, height: 30.7)
shapeArray.append(rect)
let circle = Circle(radius: 10.7)
shapeArray.append(circle)
shapeArray.append(Rect(width: 30.3, height: 40.2))
shapeArray.append(Circle(radius: 15.5))
printShape(shapeArray)

// 도형 배열 내 도형 정보 출력 함수
// 배열 내 도형이 Circle 타입인지 아니면 Rect 타입인지에 따라
// 해당 타입으로 변환 후, 원주 또는 둘레를 출력
func printShape(_ shapes: [Shape]) {
    for i in 0..<shapes.count{
        print("------------------------")
        if(shapes[i] is Circle){
            let circle: Circle? = (shapes[i] as? Circle)
            print((circle?.description())!)
            print("면적: \((circle?.area)!)")
            print("원주: \((circle?.curcumference)!)")
        }
        else{
            let rect: Rect? = (shapes[i] as! Rect)
            print((rect?.description())!)
            print("면적: \((rect?.area)!)")
            print("둘레: \((rect?.perimeter)!)")
        }
    }
}


