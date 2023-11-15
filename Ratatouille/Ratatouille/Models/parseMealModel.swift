//
//  parseMealModel.swift
//  Ratatouille
//
//  Created by Øystein Engell on 15/11/2023.
//

import Foundation

struct parseMealModel {
    func parseMeal(meal : MealModel) -> MealModelModified {
        
        var ingredientArray: [String] = []
        var measureArray: [String] = []
        
        if meal.ingredient1 != "" && meal.ingredient1 != nil{
            ingredientArray.append(meal.ingredient1!)
        }
        
        if meal.measure1 != "" && meal.measure1 != nil{
            measureArray.append(meal.measure1!)
        }
//        for i in 1...20 {
//                if let ingredient = meal.ingredient(i)?(i), !ingredient.isEmpty {
//                    ingredientArray.append(ingredient)
//                }
//
//                if let measure = meal.measure?(i), !measure.isEmpty {
//                    measureArray.append(measure)
//                }
//            }
        
        let newMeal = MealModelModified.init(
            id: meal.id,
            title: meal.title,
            category: meal.category,
            area: meal.area,
            instructions: meal.instructions,
            image: meal.image,
            tags: meal.tags,
            video: meal.video,
            ingredients: ingredientArray,
            measures: measureArray
        )
        return newMeal
    
    }
}
