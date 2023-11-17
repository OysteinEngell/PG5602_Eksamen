//
//  SearchView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct SearchView: View {
    
    var mealApiClient = MealAPIClient.live
    @State var tabSelected = "Landområde"
    @State var selectedArea = "Italian"
    @State var meals: [SearchMealModel] = []
    
    func getMealsbyArea(area: String) async{
        Task{
            do{
                meals = try await mealApiClient.getMealsByArea(area)
            }catch let error{
                print(error)
            }
        }
    }
    
    
    var body: some View {
        VStack{
            Picker(selection: $tabSelected, label: Text(""), content: {
                Image(systemName: "globe").tag("Landområde")
                Image(systemName: "rectangle.3.group.bubble").tag("Kategori")
                Image(systemName: "carrot.fill").tag("Ingrediens")
                Image(systemName: "magnifyingglass").tag("Navn")
                
            }).pickerStyle(.segmented).safeAreaPadding()
            
            
            Text("\(tabSelected): \(selectedArea)").font(.title).bold()
               
          
            
            SearchMealListView(meals: meals)
            Spacer()
            
            Button(action: {
                
            }, label: {
                ZStack{
                    Rectangle().frame(width: 300, height: 50).cornerRadius(40).foregroundColor(.primary)
                    Text("Velg \(tabSelected)").foregroundStyle(.white).bold()
                }.padding(.vertical)
                
            })
            
            
        }.onAppear{
            Task{
                await getMealsbyArea(area: selectedArea)
            }
           
        }
    }
}

#Preview {
    SearchView()
}
