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
        let tags: String
        let video: String
        let ingredients: [String]
        let measures: [String]
}


