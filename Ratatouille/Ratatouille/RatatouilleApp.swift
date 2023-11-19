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
                MyRecipesView()
                    .tabItem {
                        Label("Mine Oppskrifter", systemImage: "fork.knife.circle.fill")
                    }
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
            
            
            
            
            
            
        }catch let error{print(error)}
        
    }
}
