//
//  SearchView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct SearchView: View {
    
    var recipeApiClient = RecipeAPIClient.live
    @State var tabSelected = "area"
    @State var meals: [FilteredMealModel] = []
    
    func getMealsbyArea(area: String) async{
        Task{
            do{
                meals = try await recipeApiClient.getRecipesByArea(area)
            }catch let error{
                print(error)
            }
        }
    }
    
    
    var body: some View {
        VStack{
            Picker(selection: $tabSelected, label: Text(""), content: {
                Image(systemName: "globe").tag("area")
                Image(systemName: "rectangle.3.group.bubble").tag("category")
                Image(systemName: "carrot.fill").tag("ingredient")
                Image(systemName: "magnifyingglass").tag("title")
                
            }).pickerStyle(.segmented)
            
            ForEach(meals){meal in
                Text(meal.title)
            }
            Spacer()
            
        }.onAppear{
            Task{
                await getMealsbyArea(area: "italian")
            }
           
        }.padding()
    }
}

#Preview {
    SearchView()
}
