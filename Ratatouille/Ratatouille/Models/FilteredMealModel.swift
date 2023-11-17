//
//  FilteredMealModel.swift
//  Ratatouille
//
//  Created by Øystein Engell on 16/11/2023.
//

import Foundation

struct FilteredMealModel: Identifiable, Codable {
    let id: String
    let title: String
    let image: String //Change to URL??
}
