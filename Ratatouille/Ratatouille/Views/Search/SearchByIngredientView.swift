//
//  SearchByIngredientView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 19/11/2023.
//

import SwiftUI

struct SearchByIngredientView: View {
    @ObservedObject var dataContext: DataContext
    
    let mealAPIClient = MealAPIClient.live
    @State var sheetPresented = false
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack(alignment: .center){
                    if let encodedIngredientName = dataContext.selectedIngredient.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
                        let urlString = "\(dataContext.selectedIngredient.image)\(encodedIngredientName)-Small.png"
                    
                    AsyncImage(url: URL(string: urlString )){image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                        .cornerRadius(40)}placeholder: {
                            ProgressView().padding(20)
                        }
                    }
                  
                        Text("Ingrediens: \(dataContext.selectedIngredient.name)").font(.title).bold()
                }.padding(.horizontal)
                
                ScrollView{
                    Text(dataContext.selectedIngredient.info ?? "")
                }.padding()
                
            }.frame(height: 200)
            
            SearchMealListView(meals: dataContext.ingredientFilteredMealArray)
            
            Button(action: {
                sheetPresented = true
            }, label: {
                ZStack{
                    Rectangle().frame(width: 250, height: 50).cornerRadius(30).foregroundColor(.primary)
                    Text("Velg ingrediens").bold()
                }.padding(.vertical)
            })
            
            .sheet(isPresented: $sheetPresented){
                NavigationStack{
                    List{
                        Section{
                            ForEach(dataContext.ingredientArray){ingredient in
                                Button(action: {
                                    handleChange(ingredient: ingredient)
                                    sheetPresented = false
                                }, label: {
                                    HStack{
                                        if let encodedIngredientName = ingredient.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
                                            let urlString = "\(ingredient.image)\(encodedIngredientName)-Small.png"
                                            
                                            AsyncImage(url: URL(string: urlString )){image in
                                                image.resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 75)
                                                .cornerRadius(40)} placeholder: {
                                                    ProgressView().padding(20)
                                                  }
                                            .padding(.trailing, 20)
                                        }
                                        VStack{
                                            Text(ingredient.name).font(.title2).foregroundStyle(.primary).bold()
                                        }
                                        Spacer()
                                    }
                                })
                            }
                        }
                    }
                    .navigationTitle("Velg en ingrediens")
                }
            }
        }
    }
    func handleChange(ingredient: IngredientModel){
        dataContext.selectedIngredient = ingredient
        Task{
            dataContext.ingredientFilteredMealArray = try await mealAPIClient.getMealsByIngredient(dataContext.selectedIngredient.name)
        }
    }
}

#Preview {
    SearchByIngredientView(dataContext: DataContext())
}
