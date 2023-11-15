//
//  CategoryModel.swift
//  Ratatouille
//
//  Created by Øystein Engell on 15/11/2023.
//

import Foundation

struct CategoryModel: Codable {
    let id: String
    let title: String
    let image: String
    let info: String
    
    enum CodingKeys: String, CodingKey{
        case id = "idCategory"
        case title = "strCategory"
        case image = "strCategoryThumb"
        case info = "strCategoryDescription"
    }
}
