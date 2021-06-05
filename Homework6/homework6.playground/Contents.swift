import UIKit

// 동영상 강의의 Suit 열거체인데..
// 원시값의 타입으로 Int가 추가되고 spades의 원시값으로 1이(spades = 1) 설정된 것에 주의!
enum Suit: Int {
    case spades = 1
    case hearts, diamonds, clubs // 2, 3, 4
    func description() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}

// 동영상 강의의 Rank 열거체
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, sevven, eight, nine, ten // 2, 3, 4, 5, 6, 7, 8, 9, 10
    case jack, queen, king // 11, 12, 13
    func description() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

// Card 클래스
class Card {
    static let cardWidth: Int = 50              // 카드 폭 - static 상수, Java나 C++의 static과 같은 개념
    static let cardHeight: Int = 70             // 카드 높이 - static 상수
    var faceup: Bool = false                    // 카드의 앞뒷면 상태, 뒷면(false)이 기본
    var rank: Rank                              // 카드의 숫자
    var suit: Suit                              // 카드의 무늬
    var color: String {                         // 카드의 색, computed property로 구현
        if suit.rawValue == 2 || suit.rawValue == 3 {
            return "Red"
        }
        else{
            return "Black"
        }
    }
    init(suit: Suit, rank : Rank){
        self.rank = rank
        self.suit = suit
    }
    func description(){
        if faceup == false{
            print("BACK")
        }
        else{
            print("\(suit.description()) \(rank.description())")
        }
    }
    func flip(){
        faceup = true
    }
}

//--------------------------
print("CARD--------")
let card1 = Card(suit: .hearts, rank: .ace)
print(card1.color)
card1.description()
card1.flip()
card1.description()
let card2: Card? = Card(suit: .clubs, rank: .eight)
card2?.flip()
card2?.description()
//--------------------------
print("CARDS--------")
var cards: [Card] = []                          // 카드 객체의 배열

// 내포된 for문으로 52장의 카드 객체들을 생성해서 cards 배열에 넣음
// Suit는 1부터 4까지, Rank는 1부터 13까지의 rawValue를 갖음
// let s = Suit(rawValue: 3)은 rawValue 3인 Suit 열거체 상수를 생성하는 문장인데..
// Suit 생성자는 실패할 경우, nil을 반환하기 때문에 s는 Suit? 타입인 점에 주의! Rank도 마찬가지

for i in 1...4 {
    for j in 1...13 {
        if let s = Suit(rawValue: i),
           let r = Rank(rawValue: j){
            cards.append(Card(suit: s, rank: r))

        }
    }
}
cards.shuffle()                              // 배열 내 카드 객체들을 섞음, shuffle 메소드는 Swift4.2부터 지원
for i in 0..<5 {                                // 배열로부터 처음 다섯 카드 객체들을 뒤집어 출력
    cards[i].flip()
    cards[i].description()                       // 임의로 섞기 때문에 출력 때마다 출력되는 카드들이 다름
}
