//
//  CategoryModel.swift
//  Ratatouille
//
//  Created by Øystein Engell on 15/11/2023.
//

import Foundation

struct CategoryModel: Codable, Identifiable {
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

extension CategoryModel{
    static let demo = [
        CategoryModel.init(id: "1", title: "Demo Kategori", image: "https://www.themealdb.com/images/category/beef.png", info: "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"),
        CategoryModel.init(id: "2", title: "Demo Kategori", image: "https://www.themealdb.com/images/category/beef.png", info: "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"),
        CategoryModel.init(id: "3", title: "Demo Kategori", image: "https://www.themealdb.com/images/category/beef.png", info: "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]")
    ]
}
