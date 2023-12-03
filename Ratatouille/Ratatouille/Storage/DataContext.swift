

import Foundation

class DataContext: ObservableObject {
    
    @Published var areaArray: [AreaModel] = AreaModel.demoArray
    @Published var selectedArea: AreaModel = AreaModel.demo
    @Published var areaFilteredMealArray: [SearchMealModel] = SearchMealModel.demoArray
    
    
    @Published var categoryArray: [CategoryModel] = CategoryModel.demoArray
    @Published var selectedCategory: CategoryModel = CategoryModel.demo
    @Published var categoryFilteredMealArray: [SearchMealModel] = SearchMealModel.demoArray
    
    @Published var ingredientArray: [IngredientModel] = IngredientModel.demoArray
    @Published var selectedIngredient: IngredientModel = IngredientModel.demo
    @Published var ingredientFilteredMealArray: [SearchMealModel] = SearchMealModel.demoArray
    
    @Published var nameFilteredMealArray: [MealModel] = MealModel.demoArray
    @Published var selectedName: MealModel = MealModel.placeholder
    
    @Published var numberOfMealsInStorage = 0
    @Published var darkMode = false
}
