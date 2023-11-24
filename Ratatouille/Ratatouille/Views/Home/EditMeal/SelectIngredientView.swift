//
//  SelectIngredientView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 24/11/2023.
//

import SwiftUI

struct SelectIngredientView: View {
    @EnvironmentObject var dataContext: DataContext
    
    @Binding var selectedIngredient: String
    @Binding var inputMeasure: String
    
//    var handleData: (()->())
    
    var body: some View {
        NavigationStack{
            List{
                HStack{
                    Picker("", selection: $selectedIngredient) {
                        ForEach(dataContext.ingredientArray){ingredient in
                            Text(ingredient.name).tag(ingredient.name)
                        }
                    }.frame(width: 160, alignment: .leading)
                        .labelsHidden()
                    Text("Mengde: ")
                    TextField(text: $inputMeasure){
                        
                    }
                }
            }
            .navigationTitle("Velg ingrediens")
            .toolbar(content: {
                Button(action: {
                    
                }, label: {
                    Text("Lagre")
                })
            })
            
        }
    }
}

#Preview {
    SelectIngredientView( selectedIngredient: .constant("demo"), inputMeasure: .constant("100g"))
}
