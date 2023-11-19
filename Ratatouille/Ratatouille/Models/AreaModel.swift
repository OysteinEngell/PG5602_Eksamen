//
//  AreaModel.swift
//  Ratatouille
//
//  Created by Øystein Engell on 15/11/2023.
//

import Foundation

struct AreaModel: Codable, Identifiable {
    var id = UUID()
    var name: String
    var flag: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "strArea"
    }
}

extension AreaModel{
    static let demo = AreaModel.init(name: "Italian")
    static let demoArray = [
        AreaModel.init(name: "Italian"),
        AreaModel.init(name: "Greek"),
        AreaModel.init(name: "American")
    ]
}
