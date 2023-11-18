//
//  RecipeAPIClient.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import Foundation

struct MealAPIClient {
    var getMealByName: (( _ mealName: String) async throws -> [MealModel])
    //    var getRecipeById: (() async throws -> ())
    var getMealsByArea: ((_ area: String) async throws -> [SearchMealModel])
    var getMealsByCategory: ((_ category: String) async throws -> [SearchMealModel])
    //    var getRecipesByIngredient: (() async throws -> ())
    //
    var getCategories: (() async throws -> [CategoryModel])
    var getAreas: (() async throws -> [AreaModel])
    var getIngredients: (() async throws -> [IngredientModel])
}

extension MealAPIClient {
    static let live = MealAPIClient { mealName in
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(mealName)")!
        
        var urlRequest = URLRequest.init(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        if let statusCode = (response as? HTTPURLResponse)?.statusCode {
            switch statusCode {
                
            case 200...299:
                print("getMealByName() response: \(statusCode), with data: \(data)")
                let mealData = try JSONDecoder().decode(MealResponse.self, from: data)
                return mealData.meals
                
            default: print("Something went wrong")
            }
        }
        return []
        
    } getMealsByArea: { area in
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?a=\(area)")!
        
        var urlRequest = URLRequest.init(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        if let statusCode = (response as? HTTPURLResponse)?.statusCode {
            switch statusCode {
                
            case 200...299:
                print("getMealsByArea response: \(statusCode), with data: \(data)")
                do{
                    let filteredData = try JSONDecoder().decode(SearchResponse.self, from: data)
                    //                    print(categoryData)
                    return filteredData.meals
                }catch let error{
                    print(error)
                }
                
            default: print("Something went wrong")
            }
        }
        return []
    } getMealsByCategory: { category in
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)")!
        
        var urlRequest = URLRequest.init(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        if let statusCode = (response as? HTTPURLResponse)?.statusCode {
            switch statusCode {
                
            case 200...299:
                print("getMealsByCategorie() response: \(statusCode), with data: \(data)")
                do{
                    let filteredData = try JSONDecoder().decode(SearchResponse.self, from: data)
                    
                    return filteredData.meals
                }catch let error{
                    print(error)
                }
                
            default: print("Something went wrong")
            }
        }
        return []
    } getCategories: {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!
        
        var urlRequest = URLRequest.init(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        if let statusCode = (response as? HTTPURLResponse)?.statusCode {
            switch statusCode {
                
            case 200...299:
                print("getCategories() response: \(statusCode), with data: \(data)")
                do{
                    let categoryData = try JSONDecoder().decode(CategoryResponse.self, from: data)
                    //                    print(categoryData)
                    return categoryData.categories
                }catch let error{
                    print(error)
                }
                
            default: print("Something went wrong")
            }
        }
        return []
    } getAreas: {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/list.php?a=list")!
        
        var urlRequest = URLRequest.init(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        if let statusCode = (response as? HTTPURLResponse)?.statusCode {
            switch statusCode {
                
            case 200...299:
                print("getAreas() response: \(statusCode), with data: \(data)")
                do{
                    let areaData = try JSONDecoder().decode(AreaResponse.self, from: data)
                    //                    print(areaData)
                    return areaData.meals
                }catch let error{
                    print(error)
                }
                
            default: print("Something went wrong")
            }
        }
        return []
    }getIngredients: {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/list.php?i=list")!
        
        var urlRequest = URLRequest.init(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        if let statusCode = (response as? HTTPURLResponse)?.statusCode {
            switch statusCode {
                
            case 200...299:
                print("getIngredients() response: \(statusCode), with data: \(data)")
                do{
                    let ingredientData = try JSONDecoder().decode(IngredientResponse.self, from: data)
                    //                    print(ingredientData)
                    return ingredientData.meals
                }catch let error{
                    print(error)
                }
                
            default: print("Something went wrong")
            }
        }
        return []
    }
}//extention recipeAPIClient

struct MealResponse: Codable {
    let meals: [MealModel]
}

struct SearchResponse: Codable {
    let meals: [SearchMealModel]
}

struct CategoryResponse: Codable {
    let categories: [CategoryModel]
}

struct AreaResponse: Codable {
    let meals: [AreaModel]
}

struct IngredientResponse: Codable {
    let meals: [IngredientModel]
}


