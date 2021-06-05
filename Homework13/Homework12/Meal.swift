//
//  Meal.swift
//  Homework12
//
//  Created by 윾진ʕ·ᴥ·ʔ의 요술봉🪄 on 2021/05/31.
//

import UIKit

class Meal {
    var title: String?
    var description: String?
    var image: UIImage?
}

let dataset = [
    ("Caprese Salad", "a simple Italian salad, made of sliced fresh mozzarella, tomatoes, and sweet basil", "meal1.png"),
    ("Chicken and Potatoes", "an Italian-American dish made from chicken and wedges of potato", "meal2.png"),
    ("Pasta with Meatballs", "an Italian-American dish consisting of spaghetti, tomato sauce and meatballs", "meal3.png"),
]

var meals: [Meal] = []

