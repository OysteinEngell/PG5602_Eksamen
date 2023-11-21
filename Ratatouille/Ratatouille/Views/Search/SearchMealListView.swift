//
//  SearchMealListView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 17/11/2023.
//

import SwiftUI

struct SearchMealListView: View {
    let meals: [SearchMealModel]
    
    var body: some View {
        
      
            List{
                ForEach(meals){meal in
                    
                    NavigationLink{
                        FetchDetailView(id: meal.id)
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
