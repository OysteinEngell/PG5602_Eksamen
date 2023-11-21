//
//  FetchDetailView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 21/11/2023.
//

import SwiftUI

struct FetchDetailView: View {
  
    let mealAPIClient = MealAPIClient.live
    
    @State var detailedMeal: MealModelModified? = nil
    @State var status: String = "Loading..."
    let id: String
    
    var body: some View {
        VStack{
            if(detailedMeal != nil){
                ScrollView{
                    AsyncImage(url: URL(string: detailedMeal!.image )){image in
                        image.image?.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 420)
                    }
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text(detailedMeal!.title).font(.title).bold()
                            Text(detailedMeal!.category)
                        }
                        Spacer()
                    }.padding(EdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 30))
                    
                    VStack{
                        HStack{
                            Text("Ingredienser").bold().font(.title3).padding(.bottom)
                            Spacer()
                        }
                        
                        HStack{
                            VStack(alignment: .leading){
                                ForEach(detailedMeal!.measures, id: \.self){measure in
                                    Text(measure)
                                    Divider()
                                }
                            }
                            VStack(alignment: .leading){
                                ForEach(detailedMeal!.ingredients, id: \.self){ingredient in
                                    Text(ingredient)
                                    Divider()
                                }
                            }
                            Spacer()
                            
                        }
                        
                    }.padding(EdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 30))
                   
                        HStack{
                            VStack(alignment: .leading){
                                Text("Instruksjoner").bold().font(.title3).padding(.bottom)
                                
                                Text(detailedMeal!.instructions )
                            }
                            Spacer()
                        }.padding(EdgeInsets(top: 0, leading: 30, bottom: 50, trailing: 30))
                 
                    VStack{}.frame(height: 100)
                }.ignoresSafeArea(.container)
            }else{
                Text(status)
            }
        }.onAppear{
            Task{
                await fetchMeal()
            }
        }
    }
    func fetchMeal() async{
            do{
                if let response = try await mealAPIClient.getMealById(id){
                    let result = MealTransformer().modifyMealModel(meal: response)
                    detailedMeal = result
                }else{
                    status = "Could not get the data for this meal :("
                }
            }catch let error{
                print(error)
            }
        }
        
    }


#Preview {
    FetchDetailView(id: "1111")
}
