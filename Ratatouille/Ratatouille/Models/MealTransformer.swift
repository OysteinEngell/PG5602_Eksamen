
// - Converts MealModel into coreData Meal entity or MealModelModified
// - Converts all ingredient and measure parameters into arrays and discards empty strings / nil.

import Foundation
import SwiftUI
import CoreData


struct MealTransformer {

    func modifyMealModel(meal: MealModel) -> MealModelModified {

        let arrays = convertToArray(meal: meal)
        
        let modifiedMeal = MealModelModified(
            id: meal.id,
            title: meal.title,
            category: meal.category,
            area: meal.area,
            instructions: meal.instructions,
            image: meal.image,
            video: meal.video,
            ingredients: arrays.ingredientArray,
            measures: arrays.measureArray
        )
        
        return modifiedMeal
    }
    
    func parseMealArray(meals: [MealModel], context: NSManagedObjectContext) -> [Meal] {
        
        var newMealsArray: [Meal] = []
        
        for meal in meals{
            
            let arrays = convertToArray(meal: meal)
            
            let newMeal = Meal(context: context)
            
            newMeal.id = meal.id
            newMeal.title = meal.title
            newMeal.category = meal.category
            newMeal.area = meal.area
            newMeal.instructions = meal.instructions
            newMeal.image = meal.image
            newMeal.video = meal.video
            newMeal.ingredients = arrays.ingredientArray
            newMeal.measures = arrays.measureArray
            newMeal.favorite = false
            newMeal.archived = false
            
            
            newMealsArray.append(newMeal)
            
        }
        return newMealsArray
    }
    
    
    func parseMealObject(meal: MealModel, context: NSManagedObjectContext) -> Meal {

        let arrays = convertToArray(meal: meal)
        
        let newMeal = Meal(context: context)
        
        newMeal.id = meal.id
        newMeal.title = meal.title
        newMeal.category = meal.category
        newMeal.area = meal.area
        newMeal.instructions = meal.instructions
        newMeal.image = meal.image
        newMeal.video = meal.video
        newMeal.ingredients = arrays.ingredientArray
        newMeal.measures = arrays.measureArray
        newMeal.favorite = false
        newMeal.archived = false
        
        return newMeal
    }
    
    func convertToArray(meal: MealModel) -> (ingredientArray: [String], measureArray: [String]){
        var ingredientArray: [String] = []
        var measureArray: [String] = []
        
        //  Tried to iterate through all the parameters, but ended up having to do it manually
        //
        //        for i in 1...20 {
        //                if let ingredient = meal.ingredient(i), !ingredient.isEmpty {
        //                    ingredientArray.append(ingredient)
        //                }
        //
        //                if let measure = meal.measure?(i), !measure.isEmpty {
        //                    measureArray.append(measure)
        //                }
        //            }
        
        if meal.ingredient1 != "" && meal.ingredient1 != nil && meal.ingredient1 != " " {
            ingredientArray.append(meal.ingredient1!)
        }
        
        if meal.ingredient2 != "" && meal.ingredient2 != nil && meal.ingredient2 != " " {
            ingredientArray.append(meal.ingredient2!)
        }
        
        if meal.ingredient3 != "" && meal.ingredient3 != nil && meal.ingredient3 != " " {
            ingredientArray.append(meal.ingredient3!)
        }
        
        if meal.ingredient4 != "" && meal.ingredient4 != nil && meal.ingredient4 != " "{
            ingredientArray.append(meal.ingredient4!)
        }
        
        if meal.ingredient5 != "" && meal.ingredient5 != nil && meal.ingredient5 != " "{
            ingredientArray.append(meal.ingredient5!)
        }
        
        if meal.ingredient6 != "" && meal.ingredient6 != nil && meal.ingredient6 != " "{
            ingredientArray.append(meal.ingredient6!)
        }
        
        if meal.ingredient7 != "" && meal.ingredient7 != nil && meal.ingredient7 != " "{
            ingredientArray.append(meal.ingredient7!)
        }
        
        if meal.ingredient8 != "" && meal.ingredient8 != nil && meal.ingredient8 != " "{
            ingredientArray.append(meal.ingredient8!)
        }
        
        if meal.ingredient9 != "" && meal.ingredient9 != nil && meal.ingredient9 != " "{
            ingredientArray.append(meal.ingredient9!)
        }
        
        if meal.ingredient10 != "" && meal.ingredient10 != nil && meal.ingredient10 != " "{
            ingredientArray.append(meal.ingredient10!)
        }
        
        if meal.ingredient11 != "" && meal.ingredient11 != nil && meal.ingredient11 != " "{
            ingredientArray.append(meal.ingredient11!)
        }
        
        if meal.ingredient12 != "" && meal.ingredient12 != nil && meal.ingredient12 != " "{
            ingredientArray.append(meal.ingredient12!)
        }
        
        if meal.ingredient13 != "" && meal.ingredient13 != nil && meal.ingredient13 != " "{
            ingredientArray.append(meal.ingredient13!)
        }
        
        if meal.ingredient14 != "" && meal.ingredient14 != nil && meal.ingredient14 != " "{
            ingredientArray.append(meal.ingredient14!)
        }
        
        if meal.ingredient15 != "" && meal.ingredient15 != nil && meal.ingredient15 != " "{
            ingredientArray.append(meal.ingredient15!)
        }
        
        if meal.ingredient16 != "" && meal.ingredient16 != nil && meal.ingredient16 != " "{
            ingredientArray.append(meal.ingredient16!)
        }
        
        if meal.ingredient17 != "" && meal.ingredient17 != nil && meal.ingredient17 != " "{
            ingredientArray.append(meal.ingredient17!)
        }
        
        if meal.ingredient18 != "" && meal.ingredient18 != nil && meal.ingredient18 != " "{
            ingredientArray.append(meal.ingredient18!)
        }
        
        if meal.ingredient19 != "" && meal.ingredient19 != nil && meal.ingredient19 != " "{
            ingredientArray.append(meal.ingredient19!)
        }
        
        if meal.ingredient20 != "" && meal.ingredient20 != nil && meal.ingredient20 != " "{
            ingredientArray.append(meal.ingredient20!)
        }
        
        if meal.measure1 != "" && meal.measure1 != nil && meal.measure1 != " "{
            measureArray.append(meal.measure1!)
        }
        
        if meal.measure2 != "" && meal.measure2 != nil && meal.measure2 != " "{
            measureArray.append(meal.measure2!)
        }
        
        if meal.measure3 != "" && meal.measure3 != nil && meal.measure3 != " "{
            measureArray.append(meal.measure3!)
        }
        
        if meal.measure4 != "" && meal.measure4 != nil && meal.measure4 != " "{
            measureArray.append(meal.measure4!)
        }
        
        if meal.measure5 != "" && meal.measure5 != nil && meal.measure5 != " "{
            measureArray.append(meal.measure5!)
        }
        
        if meal.measure6 != "" && meal.measure6 != nil && meal.measure6 != " "{
            measureArray.append(meal.measure6!)
        }
        
        if meal.measure7 != "" && meal.measure7 != nil && meal.measure7 != " "{
            measureArray.append(meal.measure7!)
        }
        
        if meal.measure8 != "" && meal.measure8 != nil && meal.measure8 != " "{
            measureArray.append(meal.measure8!)
        }
        
        if meal.measure9 != "" && meal.measure9 != nil && meal.measure9 != " "{
            measureArray.append(meal.measure9!)
        }
        
        if meal.measure10 != "" && meal.measure10 != nil && meal.measure10 != " "{
            measureArray.append(meal.measure10!)
        }
        
        if meal.measure11 != "" && meal.measure11 != nil && meal.measure11 != " "{
            measureArray.append(meal.measure11!)
        }
        
        if meal.measure12 != "" && meal.measure12 != nil && meal.measure12 != " "{
            measureArray.append(meal.measure12!)
        }
        
        if meal.measure13 != "" && meal.measure13 != nil && meal.measure13 != " "{
            measureArray.append(meal.measure13!)
        }
        
        if meal.measure14 != "" && meal.measure14 != nil && meal.measure14 != " "{
            measureArray.append(meal.measure14!)
        }
        
        if meal.measure15 != "" && meal.measure15 != nil && meal.measure15 != " "{
            measureArray.append(meal.measure15!)
        }
        
        if meal.measure16 != "" && meal.measure16 != nil && meal.measure16 != " "{
            measureArray.append(meal.measure16!)
        }
        
        if meal.measure17 != "" && meal.measure17 != nil && meal.measure17 != " "{
            measureArray.append(meal.measure17!)
        }
        
        if meal.measure18 != "" && meal.measure18 != nil && meal.measure18 != " "{
            measureArray.append(meal.measure18!)
        }
        
        if meal.measure19 != "" && meal.measure19 != nil && meal.measure19 != " "{
            measureArray.append(meal.measure19!)
        }
        
        if meal.measure20 != "" && meal.measure20 != nil && meal.measure20 != " "{
            measureArray.append(meal.measure20!)
        }
        
        return(ingredientArray, measureArray)
    }
}
