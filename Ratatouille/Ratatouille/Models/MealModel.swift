//
//  MealModel.swift
//  Ratatouille
//
//  Created by Øystein Engell on 15/11/2023.
//

import Foundation

struct MealModel: Codable, Identifiable {
    var id: String
    var title: String
    var category: String
    var area: String
    var instructions: String
    var image: String
    var tags: String?
    var video: String
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    let ingredient11: String?
    let ingredient12: String?
    let ingredient13: String?
    let ingredient14: String?
    let ingredient15: String?
    let ingredient16: String?
    let ingredient17: String?
    let ingredient18: String?
    let ingredient19: String?
    let ingredient20: String?
    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
    let measure11: String?
    let measure12: String?
    let measure13: String?
    let measure14: String?
    let measure15: String?
    let measure16: String?
    let measure17: String?
    let measure18: String?
    let measure19: String?
    let measure20: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case title = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case image = "strMealThumb"
        case tags = "strTags"
        case video = "strYoutube"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
    }
}

extension MealModel{
    static let demo = MealModel.init(id: "1", title: "Spaghetti Bolognese", category: "Main Course", area: "Italian", instructions: "Boil spaghetti, cook ground beef, mix with tomato sauce, and serve hot.", image: "spaghetti_image.jpg", tags: "pasta, beef, Italian", video: "https://www.youtube.com/watch?v=12345", ingredient1: "Spaghetti",
        ingredient2: "Ground Beef",ingredient3: "Tomato Sauce",ingredient4: nil,ingredient5: nil,ingredient6: nil,ingredient7: nil,ingredient8: nil,ingredient9: nil,ingredient10: nil,ingredient11: nil,ingredient12: nil,ingredient13: nil,ingredient14: nil,ingredient15: nil,ingredient16: nil,ingredient17: nil,ingredient18: nil,ingredient19: nil,ingredient20: nil,measure1: "300g",measure2: "500g",measure3: "400ml",measure4: nil,measure5: nil,measure6: nil,measure7: nil,measure8: nil,measure9: nil,measure10: nil,measure11: nil,measure12: nil,measure13: nil,measure14: nil,measure15: nil,measure16: nil,measure17: nil,measure18: nil,measure19: nil,measure20: nil)
    
    static let placeholder = MealModel(id: "placeholder", title: "", category: "", area: "", instructions: "", image: "", tags: "", video: "", ingredient1: "", ingredient2: "", ingredient3: "", ingredient4: "", ingredient5: "", ingredient6: "", ingredient7: "", ingredient8: "", ingredient9: "", ingredient10: "", ingredient11: "", ingredient12: "", ingredient13: "", ingredient14: "", ingredient15: "", ingredient16: "", ingredient17: "", ingredient18: "", ingredient19: "", ingredient20: "", measure1: "", measure2: "", measure3: "", measure4: "", measure5: "", measure6: "", measure7: "", measure8: "", measure9: "", measure10: "", measure11: "", measure12: "", measure13: "", measure14: "", measure15: "", measure16: "", measure17: "", measure18: "", measure19: "", measure20: "")
    
    static let demoArray = [
        MealModel.init(id: "1", title: "Spaghetti Bolognese", category: "Main Course", area: "Italian", instructions: "Boil spaghetti, cook ground beef, mix with tomato sauce, and serve hot.", image: "spaghetti_image.jpg", tags: "pasta, beef, Italian", video: "https://www.youtube.com/watch?v=12345", ingredient1: "Spaghetti",
            ingredient2: "Ground Beef",ingredient3: "Tomato Sauce",ingredient4: nil,ingredient5: nil,ingredient6: nil,ingredient7: nil,ingredient8: nil,ingredient9: nil,ingredient10: nil,ingredient11: nil,ingredient12: nil,ingredient13: nil,ingredient14: nil,ingredient15: nil,ingredient16: nil,ingredient17: nil,ingredient18: nil,ingredient19: nil,ingredient20: nil,measure1: "300g",measure2: "500g",measure3: "400ml",measure4: nil,measure5: nil,measure6: nil,measure7: nil,measure8: nil,measure9: nil,measure10: nil,measure11: nil,measure12: nil,measure13: nil,measure14: nil,measure15: nil,measure16: nil,measure17: nil,measure18: nil,measure19: nil,measure20: nil),
        
        MealModel.init(id: "2",title: "Chicken Caesar Salad",category: "Salad",area: "American",instructions: "Grill chicken, chop lettuce, mix with Caesar dressing, and top with croutons.",image: "caesar_salad_image.jpg",tags: "chicken, salad, healthy",video: "https://www.youtube.com/watch?v=67890",ingredient1: "Chicken Breast",ingredient2: "Romaine Lettuce",ingredient3: "Caesar Dressing",ingredient4: "Croutons",ingredient5: nil,ingredient6: nil,ingredient7: nil,ingredient8: nil,ingredient9: nil,ingredient10: nil,ingredient11: nil,ingredient12: nil,ingredient13: nil,ingredient14: nil,ingredient15: nil,ingredient16: nil,ingredient17: nil,ingredient18: nil,ingredient19: nil,ingredient20: nil,measure1: "400g",measure2: "1 head",measure3: "200ml",measure4: "100g",measure5: nil,measure6: nil,measure7: nil,measure8: nil,measure9: nil,measure10: nil,measure11: nil,measure12: nil,measure13: nil,measure14: nil,measure15: nil,measure16: nil,measure17: nil,measure18: nil,measure19: nil,measure20: nil
                      ),
        MealModel.init(id: "3",title: "Vegetarian Stir-Fry",category: "Vegetarian",area: "Asian",instructions: "Stir-fry mixed vegetables with tofu, soy sauce, and sesame oil until cooked.",image: "stir_fry_image.jpg",tags: "vegetarian, stir-fry, Asian",video: "https://www.youtube.com/watch?v=54321",ingredient1: "Tofu",ingredient2: "Broccoli",ingredient3: "Carrots",ingredient4: "Bell Peppers",ingredient5: "Soy Sauce",ingredient6: "Sesame Oil",ingredient7: nil,ingredient8: nil,ingredient9: nil,ingredient10: nil,ingredient11: nil,ingredient12: nil,ingredient13: nil,ingredient14: nil,ingredient15: nil,ingredient16: nil,ingredient17: nil,ingredient18: nil,ingredient19: nil,ingredient20: nil,measure1: "300g",measure2: "200g",measure3: "150g",measure4: "2",measure5: "50ml",measure6: "20ml",measure7: nil,measure8: nil,measure9: nil,measure10: nil,measure11: nil,measure12: nil,measure13: nil,measure14: nil,measure15: nil,measure16: nil,measure17: nil,measure18: nil,measure19: nil,measure20: nil
                      )
        
    ]
}

