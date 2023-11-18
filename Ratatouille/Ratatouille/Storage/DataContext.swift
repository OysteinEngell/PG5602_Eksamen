//
//  MealDataContext.swift
//  Ratatouille
//
//  Created by Øystein Engell on 18/11/2023.
//

import Foundation

class DataContext: ObservableObject {
    @Published var areaArray: [AreaModel] = AreaModel.demoArray
    @Published var areaSearchTerm: String = "Italian"
    
    @Published var categoryArray: [CategoryModel] = []
    @Published var categorySearchTerm: String = "Seafood"
    
    @Published var ingredientArray: [IngredientModel] = []
    @Published var ingredientSearchTerm: String = "Pasta"
    
    @Published var areaFilteredMealArray: [SearchMealModel] = SearchMealModel.demoArray
    @Published var categoryFilteredMealArray: [SearchMealModel] = []
    @Published var ingredientFilteredMealArray: [SearchMealModel] = []
    @Published var nameFilteredMealArray: [SearchMealModel] = []
}
