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
    let flagAPI = FlagAPI()
    @State var countryCode = "unknown"
    
    @FetchRequest(entity: Area.entity(), sortDescriptors: [])
    var areas: FetchedResults<Area>
 
    
    
    var body: some View {
        VStack{
            HStack(){
                Text("Landområde: \(dataContext.selectedArea.name)").font(.title).bold()
                AsyncImage(url: URL(string: "https://flagsapi.com/\(countryCode)/flat/32.png")){image in
                    image.image?.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35)
                }
                Spacer()
            }.padding()
            
            SearchMealListView(meals: dataContext.areaFilteredMealArray)
            
            
            Picker("", selection: $dataContext.selectedArea.name) {
                ForEach(areas){area in
                    Text(area.name).tag(area.name)
                }
            }.pickerStyle(.wheel)
                .frame(height: 125)

        }.onChange(of: dataContext.selectedArea.name) { oldValue, newValue in
            handleChange()
        }.onAppear{
            countryCode = FlagAPI.countryCode(for: dataContext.selectedArea.name)
        }
    }
    
    func handleChange(){
        Task{
            dataContext.areaFilteredMealArray = try await mealAPIClient.getMealsByArea(dataContext.selectedArea.name)
            countryCode = FlagAPI.countryCode(for: dataContext.selectedArea.name)
        }
    }
}

#Preview {
    SearchByAreaView(dataContext: DataContext())
}
