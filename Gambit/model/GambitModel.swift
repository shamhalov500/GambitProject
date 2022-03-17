//
//  GambitModel.swift
//  Gambit
//
//  Created by Али Шамхалов on 12.03.2022.
//

import Foundation
import SwiftUI
struct Gambit: Decodable {
    var id: Int
    var name: String
    var price: Int
    var oldPrice: Int
    var description: String
    var image: String
    var isFavourite: Bool?
//    var nutritionFacts: String
//    var weight: Int
//    var calories: Int
//    var protein: Int
//    var fat: Int
//    var carbohydrates: Int
}
