//
//  MealDetailView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 20/11/2023.
//

import SwiftUI

struct MealDetailView: View {
    var meal: Meal
    
    var body: some View {
        ScrollView{
            AsyncImage(url: URL(string: meal.image ?? "")){image in
                image.image?.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 420)
            }
            
            HStack{
                VStack(alignment: .leading){
                    Text(meal.title).font(.title).bold()
                    Text(meal.category)
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
                        ForEach(meal.measures, id: \.self){measure in
                            Text(measure)
                            Divider()
                        }
                    }
                    VStack(alignment: .leading){
                        ForEach(meal.ingredients, id: \.self){ingredient in
                            Text(ingredient)
                            Divider()
                        }
                    }
                    Spacer()
                    
                }
                
            }.padding(EdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 30))
            
            if(meal.instructions != nil){
                
                HStack{
                    
                    VStack(alignment: .leading){
                        Text("Instruksjoner").bold().font(.title3).padding(.bottom)
                        
                        Text(meal.instructions ?? "")
                    }
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 30, bottom: 50, trailing: 30))
            }
            
            VStack{
                
            }.frame(height: 100)
            
            
            
        }.ignoresSafeArea(.container)
            .onAppear{}
    }
}

#Preview {
    MealDetailView(meal: Meal.demo)
}
