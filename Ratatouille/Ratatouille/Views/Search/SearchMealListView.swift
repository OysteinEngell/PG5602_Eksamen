//
//  SearchMealListView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 17/11/2023.
//

import SwiftUI

struct SearchMealListView: View {
    @Environment(\.managedObjectContext) private var moc
    let mealAPIClient = MealAPIClient.live
    @State var meals: [SearchMealModel]
    
    var body: some View {
        List{
            
            
            ForEach(meals){ meal in
                NavigationLink {
                    MealDetailView(id: meal.id)
                } label: {
                    SearchMealItemView(meal: meal)
                }
                
            }
            
            
            
            
        }
    }
}
    
    #Preview {
        SearchMealListView(meals: SearchMealModel.demoArray)
    }

