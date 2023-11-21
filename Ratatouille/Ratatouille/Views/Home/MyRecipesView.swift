//
//  MyRecipesView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct MyRecipesView: View {
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(entity: Meal.entity(), sortDescriptors: []) 
    var meals: FetchedResults<Meal>
    
    
    
    var body: some View {
        VStack{
            if meals.isEmpty {
                Image(systemName: "square.3.layers.3d.slash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                
                Text("Ingen matoppskrifter").bold()
            } else {
                NavigationStack{
                    Text("Matoppskrifter")
                    List{
                        ForEach(meals){meal in
                            if(meal.archived == false){
                                NavigationLink{
                                    MealDetailView(id: meal.id)
                                } label: {
                                    StoredMealItemView(favorite: meal.favorite, meal: meal)
                                }
                            }
                        }
                    }
                }
            }
        }.onAppear{
         
        }
    }
}

#Preview {
    MyRecipesView()
}
