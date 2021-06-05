//
//  Card.swift
//  CardGame
//
//  Created by dheum on 2021/04/22.
//

import UIKit

// 동영상 강의의 Suit 열거체인데..
// 원시값의 타입으로 Int가 추가되고 spades의 원시값으로 1(spades = 1)이 설정된 것에 주의!
// description 메소드는 이모티콘 문자열을 반환하는 것으로 수정
enum Suit: Int {
    case spades = 1
    case hearts, diamonds, clubs
    func description() -> String {
        switch self {
        case .spades:
            return "♣️"
        case .hearts:
            return "❤️"
        case .diamonds:
            return "♦️"
        case .clubs:
            return "♣️"
        }
    }
}

// 동영상 강의의 Rank 열거체
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, sevven, eight, nine, ten
    case jack, queen, king
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
        get {
            if suit == Suit.hearts || suit == .diamonds {
                return "Red"
            } else {
                return "Black"
            }
        }
    }
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    func flip() {
        faceup = !faceup
    }
    // return string instead of print
    func description() -> String {
        if faceup {
            return "\(suit.description()) \(rank.description())"
        } else {
            return "BACK"
        }
    }
}
