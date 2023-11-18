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
    
    
    func fetchData() async {
            do{
                let apiAreas = try await mealApiClient.getAreas()
                let apiCategories = try await mealApiClient.getCategories()
                let apiIngredients = try await mealApiClient.getIngredients()
                
                let apiAreaFilteredMeals = try await mealApiClient.getMealsByArea("Italian")
//                let apiCategoryFilteredMeals = try await mealApiClient
                
                dataContext.areaArray = apiAreas
                dataContext.categoryArray = apiCategories
                dataContext.ingredientArray = apiIngredients
                
                dataContext.areaFilteredMealArray = apiAreaFilteredMeals
                
                
            }catch let error{print(error)}
     
    }

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
}
