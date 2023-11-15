//
//  IngredientModel.swift
//  Ratatouille
//
//  Created by Øystein Engell on 15/11/2023.
//

import Foundation

struct IngredientModel: Identifiable, Codable {
    let id: String
    let name: String
    let info: String?

    enum CodingKeys: String, CodingKey {
        case id = "idIngredient"
        case name = "strIngredient"
        case info = "strDescription"
    }
}
