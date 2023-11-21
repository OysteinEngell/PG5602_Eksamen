//
//  MealTransformer.swift
//  Ratatouille
//
//  Created by Øystein Engell on 21/11/2023.
//

import Foundation
import SwiftUI


struct MealTransformer {

    func modifyMealModel(meal: MealModel) -> MealModelModified {

        var ingredientArray: [String] = []
        var measureArray: [String] = []
        
        if meal.ingredient1 != "" && meal.ingredient1 != nil {
            ingredientArray.append(meal.ingredient1!)
        }
        
        if meal.ingredient2 != "" && meal.ingredient2 != nil {
            ingredientArray.append(meal.ingredient2!)
        }
        
        if meal.ingredient3 != "" && meal.ingredient3 != nil {
            ingredientArray.append(meal.ingredient3!)
        }
        
        if meal.ingredient4 != "" && meal.ingredient4 != nil {
            ingredientArray.append(meal.ingredient4!)
        }
        
        if meal.ingredient5 != "" && meal.ingredient5 != nil {
            ingredientArray.append(meal.ingredient5!)
        }
        
        if meal.ingredient6 != "" && meal.ingredient6 != nil {
            ingredientArray.append(meal.ingredient6!)
        }
        
        if meal.ingredient7 != "" && meal.ingredient7 != nil {
            ingredientArray.append(meal.ingredient7!)
        }
        
        if meal.ingredient8 != "" && meal.ingredient8 != nil {
            ingredientArray.append(meal.ingredient8!)
        }
        
        if meal.ingredient9 != "" && meal.ingredient9 != nil {
            ingredientArray.append(meal.ingredient9!)
        }
        
        if meal.ingredient10 != "" && meal.ingredient10 != nil {
            ingredientArray.append(meal.ingredient10!)
        }
        
        if meal.ingredient11 != "" && meal.ingredient11 != nil {
            ingredientArray.append(meal.ingredient11!)
        }
        
        if meal.ingredient12 != "" && meal.ingredient12 != nil {
            ingredientArray.append(meal.ingredient12!)
        }
        
        if meal.ingredient13 != "" && meal.ingredient13 != nil {
            ingredientArray.append(meal.ingredient13!)
        }
        
        if meal.ingredient14 != "" && meal.ingredient14 != nil {
            ingredientArray.append(meal.ingredient14!)
        }
        
        if meal.ingredient15 != "" && meal.ingredient15 != nil {
            ingredientArray.append(meal.ingredient15!)
        }
        
        if meal.ingredient16 != "" && meal.ingredient16 != nil {
            ingredientArray.append(meal.ingredient16!)
        }
        
        if meal.ingredient17 != "" && meal.ingredient17 != nil {
            ingredientArray.append(meal.ingredient17!)
        }
        
        if meal.ingredient18 != "" && meal.ingredient18 != nil {
            ingredientArray.append(meal.ingredient18!)
        }
        
        if meal.ingredient19 != "" && meal.ingredient19 != nil {
            ingredientArray.append(meal.ingredient19!)
        }
        
        if meal.ingredient20 != "" && meal.ingredient20 != nil {
            ingredientArray.append(meal.ingredient20!)
        }
        
        if meal.measure1 != "" && meal.measure1 != nil {
            measureArray.append(meal.measure1!)
        }
        
        if meal.measure2 != "" && meal.measure2 != nil {
            measureArray.append(meal.measure2!)
        }
        
        if meal.measure3 != "" && meal.measure3 != nil {
            measureArray.append(meal.measure3!)
        }
        
        if meal.measure4 != "" && meal.measure4 != nil {
            measureArray.append(meal.measure4!)
        }
        
        if meal.measure5 != "" && meal.measure5 != nil {
            measureArray.append(meal.measure5!)
        }
        
        if meal.measure6 != "" && meal.measure6 != nil {
            measureArray.append(meal.measure6!)
        }
        
        if meal.measure7 != "" && meal.measure7 != nil {
            measureArray.append(meal.measure7!)
        }
        
        if meal.measure8 != "" && meal.measure8 != nil {
            measureArray.append(meal.measure8!)
        }
        
        if meal.measure9 != "" && meal.measure9 != nil {
            measureArray.append(meal.measure9!)
        }
        
        if meal.measure10 != "" && meal.measure10 != nil {
            measureArray.append(meal.measure10!)
        }
        
        if meal.measure11 != "" && meal.measure11 != nil {
            measureArray.append(meal.measure11!)
        }
        
        if meal.measure12 != "" && meal.measure12 != nil {
            measureArray.append(meal.measure12!)
        }
        
        if meal.measure13 != "" && meal.measure13 != nil {
            measureArray.append(meal.measure13!)
        }
        
        if meal.measure14 != "" && meal.measure14 != nil {
            measureArray.append(meal.measure14!)
        }
        
        if meal.measure15 != "" && meal.measure15 != nil {
            measureArray.append(meal.measure15!)
        }
        
        if meal.measure16 != "" && meal.measure16 != nil {
            measureArray.append(meal.measure16!)
        }
        
        if meal.measure17 != "" && meal.measure17 != nil {
            measureArray.append(meal.measure17!)
        }
        
        if meal.measure18 != "" && meal.measure18 != nil {
            measureArray.append(meal.measure18!)
        }
        
        if meal.measure19 != "" && meal.measure19 != nil {
            measureArray.append(meal.measure19!)
        }
        
        if meal.measure20 != "" && meal.measure20 != nil {
            measureArray.append(meal.measure20!)
        }
        
        let modifiedMeal = MealModelModified(
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
        
        return modifiedMeal
    }
}
