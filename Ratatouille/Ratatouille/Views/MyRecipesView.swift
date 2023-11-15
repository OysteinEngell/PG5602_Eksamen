//
//  MyRecipesView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct MyRecipesView: View {
    let recipeApiClient = RecipeAPIClient.live
    @State var categories: [CategoryModel] = []
    @State var areas: [AreaModel] = []
    @State var ingredients: [IngredientModel] = []
    @State var meals: [MealModel] = []
    
    func testAPI(){
        Task{
            do{
                meals = try await recipeApiClient.getMealByName("Arrabiata")
                categories = try await recipeApiClient.getCategories()
                areas = try await recipeApiClient.getAreas()
                ingredients = try await recipeApiClient.getIngredients()
            } catch let error{
                print(error)
            }
        }
    }
    
    
    
    
    var body: some View {
        VStack{
            Image(systemName: "square.3.layers.3d.slash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
            
            Text("Ingen matoppskrifter").bold()
            
            List{
                Text("Oppskrift")
                    .swipeActions(edge: .trailing){
                        Button {
                            print("Archived")
                        } label: {
                            Label("hei", systemImage: "archivebox.fill")
                        }.tint(.accentColor)
                    }
                Section{
//                    ForEach(categories) {category in
//                            VStack{
//                                Text(category.title)
//                                AsyncImage(url: URL(string: category.image)){image in
//                                    image.resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .frame(width: 100, height: 100)
//                                }placeholder: {
//                                    ProgressView()
//                                }
//                                Text(category.info)
//                                }
//                                
//
//                            }
                    ForEach(meals) {meal in
                            VStack{
                                Text(meal.title)
                                AsyncImage(url: URL(string: meal.image)){image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                }placeholder: {
                                    ProgressView()
                                }
                                Text(meal.area)
                                Text(meal.category)
                                
                                Text(meal.ingredient1 ?? "No ingredient found")
                                Text(meal.ingredient2 ?? "No ingredient found")
                                Text(meal.measure1 ?? "No measure found")
                                Text(meal.measure2 ?? "No measure found")
                                }


                            }
                        }
//                        ForEach(areas) {area in
//                            VStack{
//                                Text(area.name)
//                            }
//                    ForEach(ingredients){ingredient in
//                        VStack{
//                            Text(ingredient.name)
//                            if(ingredient.info != nil){
//                                Text(ingredient.info!)
//                            }
//                        }
//                    }
                }
            
        
        }.onAppear{
            testAPI()
        }
    }
}

#Preview {
    MyRecipesView()
}
