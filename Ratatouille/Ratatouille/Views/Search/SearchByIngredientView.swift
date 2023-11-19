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
                    AsyncImage(url: URL(string: dataContext.selectedCategory.image)){image in
                        image.image?.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                        .cornerRadius(40)}
                  
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
                    Text("Velg ingrediens").foregroundStyle(.white).bold()
                }.padding(.vertical)
            })
            
            .sheet(isPresented: $sheetPresented){
                
                    
                    List{
                        Section{
                            Text("Velg en ingrediens")
                        }
                        Section{
                            ForEach(dataContext.ingredientArray){ingredient in
                                Button(action: {
                                    handleChange(ingredient: ingredient)
                                    sheetPresented = false
                                }, label: {
                                    HStack{
                                        AsyncImage(url: URL(string: ingredient.image ?? "")){image in
                                            image.image?.resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100)
                                            .cornerRadius(40)}
                                        VStack{
                                            Text(ingredient.name).font(.title2).foregroundStyle(.primary).bold()
                                        }
                                        Spacer()
                                    }
                                })
                            }
                        }
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
