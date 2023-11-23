//
//  RatatouilleApp.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

@main
struct RatatouilleApp: App {
    let persistenceController = PersistenceController.shared
    @ObservedObject var dataContext = DataContext()
    var mealApiClient = MealAPIClient.live
    

    
    var body: some Scene {
        WindowGroup {
            TabView {
                MyRecipesView(dataContext: dataContext)
                    .tabItem {
                        Label("Mine Oppskrifter", systemImage: "fork.knife.circle.fill")
                    }.badge(dataContext.numberOfMealsInStorage)
                SearchView(dataContext: dataContext)
                    .tabItem {
                        Label("Søk", systemImage: "magnifyingglass.circle.fill")
                    }
                SettingsView()
                    .tabItem {
                        Label("Innstillinger", systemImage: "gearshape")
                    }
            }.onAppear{
                Task{
                    await fetchData()
                }
            }.environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dataContext) 
            
        }
    }
    
    func fetchData() async { //handle null / ""
        
        do{
            dataContext.areaArray = try await mealApiClient.getAreas()
            dataContext.selectedArea = dataContext.areaArray[0]
            dataContext.areaFilteredMealArray = try await mealApiClient.getMealsByArea(dataContext.selectedArea.name)
            
            
            dataContext.categoryArray = try await mealApiClient.getCategories()
            dataContext.selectedCategory = dataContext.categoryArray[0]
            dataContext.categoryFilteredMealArray = try await mealApiClient.getMealsByCategory(dataContext.selectedCategory.title)
            
            dataContext.ingredientArray = try await mealApiClient.getIngredients()
            dataContext.selectedIngredient = dataContext.ingredientArray[0]
            dataContext.ingredientFilteredMealArray = try await mealApiClient.getMealsByIngredient(dataContext.selectedIngredient.name)

            storeInCoreData()

        }catch let error{print(error)}
    }
    
    func storeInCoreData(){
        let context = persistenceController.container.viewContext
 
        dataContext.areaArray.forEach{area in
            if (try? context.fetch(Area.fetchRequest(for: area.name)).first) == nil {
                let areaEntity = Area(context: context)
                areaEntity.id = area.name
                areaEntity.name = area.name
                areaEntity.flag = FlagAPI.countryCode(for: area.name)
                areaEntity.archived = false
                areaEntity.date = nil
            }
        }
        
        dataContext.categoryArray.forEach{category in
            if (try? context.fetch(Category.fetchRequest(for: category.id)).first) == nil {
                let categoryEntity = Category(context: context)
                categoryEntity.id = category.id
                categoryEntity.title = category.title
                categoryEntity.info = category.info
                categoryEntity.image = category.image
                categoryEntity.archived = false
                categoryEntity.date = nil
            }
        }
        
        dataContext.ingredientArray.forEach{ ingredient in
            if (try? context.fetch(Ingredient.fetchRequest(for: ingredient.id)).first) == nil {
                let ingredientEntity = Ingredient(context: context)
                ingredientEntity.id = ingredient.id
                ingredientEntity.name = ingredient.name
                ingredientEntity.info = ingredient.info
                if let encodedIngredientName = ingredient.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
                    let urlString = "\(ingredient.image)\(encodedIngredientName)-Small.png".removingPercentEncoding
                    ingredientEntity.image = urlString
                }
                
                ingredientEntity.archived = false
                ingredientEntity.date = nil
            }
        }
        do{
            try context.save()
        }catch let error{
            print(error)
        }
    }
}
