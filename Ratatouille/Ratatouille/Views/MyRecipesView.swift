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
    
    func testAPI(){
        Task{
            do{
                try await recipeApiClient.getMealByName("Arrabiata")
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
//                        ForEach(categories) {category in
//                            VStack{
//                                Text(category.title)
//                                Text(category.info)
//
//                            }
//                        }
//                        ForEach(areas) {area in
//                            VStack{
//                                Text(area.name)
//                            }
                    ForEach(ingredients){ingredient in
                        VStack{
                            Text(ingredient.name)
                            if(ingredient.info != nil){
                                Text(ingredient.info!)
                            }
                        }
                        
                    }
                }
            }
        
        }.onAppear{
            testAPI()
        }
    }
}

#Preview {
    MyRecipesView()
}
