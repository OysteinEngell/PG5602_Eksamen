//
//  SearchByAreaView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 18/11/2023.
//

import SwiftUI

struct SearchByAreaView: View {
    @ObservedObject var dataContext: DataContext
    let mealAPIClient = MealAPIClient.live
    
    
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack(){
                    Text("Landområde: \(dataContext.selectedArea.name)").font(.title).bold()
                    Circle().frame(width: 25) //flag
                    Spacer()
                }.padding()
                
                SearchMealListView(meals: dataContext.areaFilteredMealArray)
                
                Picker("", selection: $dataContext.selectedArea.name) {
                    ForEach(dataContext.areaArray, id: \.id){area in
                        Text(area.name).tag(area.name)
                    }
                }.pickerStyle(.wheel)
                
            }.onChange(of: dataContext.selectedArea.name) { oldValue, newValue in
                handleChange()
            }
        }
    }
    
    func handleChange(){
        Task{
            dataContext.areaFilteredMealArray = try await mealAPIClient.getMealsByArea(dataContext.selectedArea.name)
        }
    }
}

#Preview {
    SearchByAreaView(dataContext: DataContext())
}
