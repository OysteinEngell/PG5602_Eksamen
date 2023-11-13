//
//  RecipeAPIClient.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import Foundation

struct RecipeAPIClient {
    var getRecipeByName: (( _ recipeName: String) async throws -> ())
//    var getRecipeById: (() async throws -> ())
//    var getRecipesByArea: (() async throws -> ())
//    var getRecipesByCategory: (() async throws -> ())
//    var getRecipesByIngredient: (() async throws -> ())
//    
//    var getCategories: (() async throws -> ())
//    var getAreas: (() async throws -> ())
//    var getIngredients: (() async throws -> ())
}

extension RecipeAPIClient {
    static let live = RecipeAPIClient { recipeName in
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(recipeName)")!
        
        var urlRequest = URLRequest.init(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        if let statusCode = (response as? HTTPURLResponse)?.statusCode {
            switch statusCode {
                
                case 200...299:
                    print("OK")
                
                
                default: print("Something went wrong")
            }
        }
        
      
    }
}
