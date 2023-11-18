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
    
    @State var selectedArea = "Italian"
    @State var selectedCategory = "Seafood"
    @State var selectedIngredient = "Pasta"
    @State var selectedName = ""
    
    @State var meals: [SearchMealModel] = []
    @State var areas: [AreaModel] = []
    
    func getMealsbyArea(area: String) async{
        meals = dataContext.areaFilteredMealArray
        Task{
            do{
                meals = try await mealApiClient.getMealsByArea(area)
            }catch let error{
                print(error)
            }
        }
    }
    
    func getAreas() async {
        Task{
            do{
                areas = try await mealApiClient.getAreas()
            }catch let error{
                print(error)
            }
        }
    }
    
    func handleButtonPressed(){
       sheetPresented = true
    }
    
    
    var body: some View {
        VStack{
            Picker(selection: $tabSelected, label: Text(""), content: {
                Image(systemName: "globe").tag("Landområde")
                Image(systemName: "rectangle.3.group.bubble").tag("Kategori")
                Image(systemName: "carrot.fill").tag("Ingrediens")
                Image(systemName: "magnifyingglass").tag("Navn")
                
            }).pickerStyle(.segmented).padding()
            
            
            Text("\(tabSelected): \(selectedArea)").font(.title).bold()
               
          
            
            SearchMealListView(meals: meals)
            Spacer()
            
            Button(action: {
                handleButtonPressed()
            }, label: {
                ZStack{
                    Rectangle().frame(width: 300, height: 50).cornerRadius(40).foregroundColor(.primary)
                    Text("Velg \(tabSelected)").foregroundStyle(.white).bold()
                }.padding(.vertical)
                
            })
            .sheet(isPresented: $sheetPresented){
                SearchSheetView(searchTerm: $selectedArea, areas: areas, tabSelected: "Landområde")
            }.presentationDetents([.medium])
            
        }
    }
}

#Preview {
    SearchView(dataContext: DataContext())
}
