//
//  Dessert.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import Foundation

extension Desserts: Equatable {
    static func == (lhs: Desserts, rhs: Desserts) -> Bool {
        return lhs.desserts == rhs.desserts
    }
}

struct Desserts: Codable {
    let desserts: [Dessert]
    enum CodingKeys: String, CodingKey {
        case desserts = "meals"
    }
}

struct Dessert: Codable, Identifiable, Equatable {
    let title: String
    let image: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case title = "strMeal"
        case image = "strMealThumb"
        case id    = "idMeal"
    }
}
