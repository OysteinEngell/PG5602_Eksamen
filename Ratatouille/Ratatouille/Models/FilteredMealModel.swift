

import Foundation

struct SearchMealModel: Identifiable, Codable {
    let id: String
    let title: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case title = "strMeal"
        case image = "strMealThumb"
    }
}

extension SearchMealModel{
    static let demo = SearchMealModel.init(id: "12345", title: "Demo Meal searchresponse", image: "https://www.themealdb.com/images/media/meals/syqypv1486981727.jpg")
    
    static let demoArray = [
        SearchMealModel.init(id: "12345", title: "Demo Meal searchresponse", image: "https://www.themealdb.com/images/media/meals/syqypv1486981727.jpg"),
        SearchMealModel.init(id: "22345", title: "Demo Meal searchresponse", image: "https://www.themealdb.com/images/media/meals/syqypv1486981727.jpg"),
        SearchMealModel.init(id: "32345", title: "Demo Meal searchresponse", image: "https://www.themealdb.com/images/media/meals/syqypv1486981727.jpg"),
    ]
}
