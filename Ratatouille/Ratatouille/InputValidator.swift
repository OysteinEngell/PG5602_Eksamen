//
//  InputValidator.swift
//  Ratatouille
//
//  Created by Øystein Engell on 03/12/2023.
//

import Foundation

struct InputValidator {
    static func validateName(name: String) -> Bool{
        if(name.isEmpty){
            return false
        }
        return true
    }
}
