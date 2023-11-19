//
//  SearchView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var dataContext: DataContext
    var mealApiClient = MealAPIClient.live
    
    @State var tabSelected = "Landområde"
    @State var sheetPresented = false
    
    var body: some View {
        VStack{
            Picker(selection: $tabSelected, label: Text(""), content: {
                Image(systemName: "globe").tag("Landområde")
                Image(systemName: "rectangle.3.group.bubble").tag("Kategori")
                Image(systemName: "carrot.fill").tag("Ingrediens")
                Image(systemName: "magnifyingglass").tag("Navn")
                
            }).pickerStyle(.segmented).padding()
            
            switch(tabSelected){
            case "Landområde": SearchByAreaView(dataContext: dataContext)
            case "Kategori": SearchByCategoryView(dataContext: dataContext)
            case "Ingrediens": SearchByIngredientView(dataContext: dataContext)
            case "Navn": SearchByNameView(dataContext: dataContext)
                
            default: SearchMealListView(meals: [])
            }
            
            
            
            Spacer()
            
            
            
        }
    }
}



#Preview {
    SearchView(dataContext: DataContext())
}
