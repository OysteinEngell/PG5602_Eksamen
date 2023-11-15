//
//  RecipeAPIClient.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import Foundation

struct RecipeAPIClient {
    var getMealByName: (( _ mealName: String) async throws -> ())
//    var getRecipeById: (() async throws -> ())
//    var getRecipesByArea: (() async throws -> ())
//    var getRecipesByCategory: (() async throws -> ())
//    var getRecipesByIngredient: (() async throws -> ())
//    
    var getCategories: (() async throws -> [CategoryModel])
//    var getAreas: (() async throws -> ())
//    var getIngredients: (() async throws -> ())
}

extension RecipeAPIClient {
    static let live = RecipeAPIClient { mealName in
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(mealName)")!
        
        var urlRequest = URLRequest.init(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        if let statusCode = (response as? HTTPURLResponse)?.statusCode {
            switch statusCode {
                
                case 200...299:
                    print("getMealByName() response: \(statusCode), with data: \(data)")
                    
                
                default: print("Something went wrong")
            }
        }
        
      
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
                    print(categoryData)
                    return categoryData.categories
                }catch let error{
                    print(error)
                }
                
                default: print("Something went wrong")
            }
        }
        return []
    }
}

struct CategoryResponse: Codable {
    let categories: [CategoryModel]
}


