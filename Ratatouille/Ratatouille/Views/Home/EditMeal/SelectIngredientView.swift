//
//  SelectIngredientView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 24/11/2023.
//

import SwiftUI

struct SelectIngredientView: View {
    @EnvironmentObject var dataContext: DataContext
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var inputIngredient: String
    @Binding var inputMeasure: String
    
    var handleData: ((_ inputIngredient: String, _ inputMeasure: String)->())
    
    var body: some View {
        NavigationStack{
            List{
                HStack{
                    Picker("Ingrediens", selection: $inputIngredient) {
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
                    handleData(inputIngredient, inputMeasure)
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Lagre")
                })
            })
            
        }
    }
}

#Preview {
    SelectIngredientView(inputIngredient: .constant(""), inputMeasure: .constant(""), handleData: {inputIngredient,inputMeasure in })
}