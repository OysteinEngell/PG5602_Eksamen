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
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Text("Søk").font(.title).bold()
                
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
                        
                        ZStack{
                            Rectangle().foregroundColor(.mint).cornerRadius(10).frame(width: 350, height: 50)
                            TextField("Name", text: $dataContext.selectedName.title).padding(.horizontal, 60.0)
                        }.padding(.top, 40.0)
                        
                        
                        
                        Button(action: {
                            
                            Task{
                                await handleChange()
                            }
                            
                            
                        }, label: {
                            ZStack{
                                Rectangle().frame(width: 350, height: 50).cornerRadius(10).foregroundColor(.primary)
                                Text("Søk").foregroundStyle(.white).bold()
                            }.padding(.vertical)
                        })
                        Spacer()
                        
                    }.alert(isPresented: $alertPresented){
                        Alert(title: Text(alertMessage))
                    }
                }).presentationDetents([.medium])
            }
        }
    }
    
    func handleChange() async{
        do{
            if(dataContext.selectedName.title != ""){
                dataContext.nameFilteredMealArray = try await mealAPIClient.getMealByName(dataContext.selectedName.title)
                searchResults = convertResult(inputMeals: dataContext.nameFilteredMealArray)
            }else{
                alertMessage = "You must enter a searchterm"
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
