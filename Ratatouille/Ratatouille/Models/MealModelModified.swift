//
//  MealModelModified.swift
//  Ratatouille
//
//  Created by Øystein Engell on 15/11/2023.
//

import Foundation


struct MealModelModified: Codable, Identifiable {
    let id: String
    let title: String
    let category: String
    let area: String
    let instructions: String
    let image: String
    let video: String
    let ingredients: [String]
    let measures: [String]
    let favorite: Bool
    let archived: Bool
    
    init(id: String, title: String, category: String, area: String, instructions: String, image: String, video: String, ingredients: [String], measures: [String], favorite: Bool = false, archived: Bool = false) {
        self.id = id
        self.title = title
        self.category = category
        self.area = area
        self.instructions = instructions
        self.image = image
        self.video = video
        self.ingredients = ingredients
        self.measures = measures
        self.favorite = favorite
        self.archived = archived
    }
}


