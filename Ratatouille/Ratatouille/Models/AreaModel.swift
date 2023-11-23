//
//  AreaModel.swift
//  Ratatouille
//
//  Created by Øystein Engell on 15/11/2023.
//

import Foundation

struct AreaModel: Codable{
    var id: String?
    var name: String
    var flag: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "strArea"
        
    }
    
    init(id: String? = nil, name: String, flag: String? = nil) {
          self.id = name
          self.name = name
          self.flag = flag
      }
}

extension AreaModel{
    static let demo = AreaModel.init(id: "Italian", name: "Italian")
    static let demoArray = [
        
        AreaModel.init(id: "Italian", name: "Italian"),
        AreaModel.init(id: "Greek", name: "Greek"),
        AreaModel.init(id: "American", name: "American")
    ]
}
