//
//  AreaModel.swift
//  Ratatouille
//
//  Created by Øystein Engell on 15/11/2023.
//

import Foundation

struct AreaModel: Codable, Identifiable {
    var id = UUID()
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strArea"
    }
}
