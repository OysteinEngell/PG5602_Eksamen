//
//  SearchByNameView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 19/11/2023.
//

import SwiftUI

struct SearchByNameView: View {
    @ObservedObject var dataContext: DataContext
    
    let mealAPIClient = MealAPIClient.live
    @State var sheetPresented = false
    @State var searchResults: [SearchMealModel] = []
    @State var alertPresented = false
    @State var alertMessage = "Something went wrong"
    @State var searchTerm = "Søk"
    
    var body: some View {
        VStack{
            HStack{
                Text(searchTerm).font(.title).bold()
                Spacer()
            }.padding(.leading, 20)
            
            SearchMealListView(meals: searchResults)
            Spacer()
            
            Button(action: {
                sheetPresented = true
            }, label: {
                ZStack{
                    Rectangle().frame(width: 250, height: 50).cornerRadius(30).foregroundColor(.primary)
                    Text("Søk etter oppskrift").foregroundStyle(.white).bold()
                }.padding(.vertical)
            })
            
            .sheet(isPresented: $sheetPresented, content: {
                VStack(alignment: .center){
                    
                    List{
                        Section(header: Text("Navn på oppskrift")){
                            TextField("Name", text: $dataContext.selectedName.title)
                                .autocorrectionDisabled(true)
                                .textInputAutocapitalization(.never)
                        }
                        Section{
                            Button(action: {
                                Task{
                                    await handleChange()
                                }
                            }, label: {
                                Text("Søk").bold()
                            })
                        }
                    }
                    
                    
                    
                    
                    Spacer()
                    
                }.alert(isPresented: $alertPresented){
                    Alert(title: Text(alertMessage))
                }
            }).presentationDetents([.medium])
        }
    }
    
    func handleChange() async{
        do{
            if(dataContext.selectedName.title != "" && dataContext.selectedName.title != " "){
      
                let response = try await mealAPIClient.getMealByName(dataContext.selectedName.title)
                
                dataContext.nameFilteredMealArray = response
                searchResults = convertResult(inputMeals: dataContext.nameFilteredMealArray)
                searchTerm = "\(dataContext.nameFilteredMealArray.count) Resultater for '\(dataContext.selectedName.title)'"
            }else{
                alertMessage = "Søkefeltet kan ikke være tomt!"
                alertPresented = true
            }
            if(!alertPresented){
                sheetPresented = false
            }
            
        }catch let error{
            print(error)
        }
        
    }
    
    func convertResult(inputMeals: [MealModel]) -> [SearchMealModel]{
        
        var convertedMealArray: [SearchMealModel] = []
        
        
        for meal in inputMeals {
            let newMeal = SearchMealModel(id: meal.id, title: meal.title, image: meal.image)
            convertedMealArray.append(newMeal)
        }
        return convertedMealArray
    }
}

#Preview {
    SearchByNameView(dataContext: DataContext())
}
