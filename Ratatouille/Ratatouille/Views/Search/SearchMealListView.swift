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
        
        NavigationStack{
            List{
                ForEach(meals){meal in
                    
                    NavigationLink{
                        Text("DetailView?")
                    } label: {
                        SearchMealItemView(meal: meal)
                    }
                    
                }
            }
        }
        
    }
}

#Preview {
    SearchMealListView(meals: SearchMealModel.demoArray)
}