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
        VStack{
            HStack(){
                Text("Landområde: \(dataContext.areaSearchTerm)").font(.title).bold()
                Circle().frame(width: 25) //flag
                Spacer()
            }.padding()
            
            SearchMealListView(meals: dataContext.areaFilteredMealArray)
            
            Picker("", selection: $dataContext.areaSearchTerm) {
                ForEach(dataContext.areaArray, id: \.id){area in
                    Text(area.name).tag(area.name)
                }
            }.pickerStyle(.wheel)

        }.onChange(of: dataContext.areaSearchTerm) { oldValue, newValue in
            handleChange()
        }
    }
    
    func handleChange(){
        Task{
            dataContext.areaFilteredMealArray = try await mealAPIClient.getMealsByArea(dataContext.areaSearchTerm)
        }
    }
}

#Preview {
    SearchByAreaView(dataContext: DataContext())
}
