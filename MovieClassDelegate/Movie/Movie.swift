//
//  Movie.swift
//  Movie
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/05/31.
//

import UIKit

class Movie { // Movie 클라스의 객체를 담는 구조체
    var title: String?
    var description: String?
    var image: UIImage?
}

let dataset = [ // 8개의 튜플을 갖는 배열
    ("Chasing Amy", "1997 American romantic comedy-drama film", "0.jpg"), // 튜플
    ("Mallrats", "1995 American romantic buddy comedy film", "1.jpg"),
    ("Dogma", "1999 American fantasy comedy film", "2.jpg"),
    ("Clerks", "1994 American independent black-and-white buddy comedy film", "3.jpg"),
    ("Jay & Silent Bob Strike Back", "2001 American comedy film", "4.jpg"),
    ("Red State", "2011 American independent horror thriller film", "5.jpg"),
    ("Cop Out", "2010 American buddy cop action-comedy film", "6.jpg"),
    ("Jersey Girl", "2004 American comedy-drama film", "7.jpg")
]

var movies: [Movie] = [] // 8개의 Movie객체를 만들어서 넣음
