//
//  MealModel.swift
//  Ratatouille
//
//  Created by Øystein Engell on 15/11/2023.
//

import Foundation
struct MealModel: Codable, Identifiable {
    let id: String
    let title: String
    let category: String
    let area: String
    let instructions: String
    let image: String
    let tags: String
    let video: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case title = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case image = "strMealThumb"
        case tags = "strTags"
        case video = "strYoutube"
    }
}
