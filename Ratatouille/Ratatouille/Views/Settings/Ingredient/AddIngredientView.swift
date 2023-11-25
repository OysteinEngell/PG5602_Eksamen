//
//  AddIngredientView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 25/11/2023.
//

import SwiftUI

struct AddIngredientView: View {
    @Environment(\.managedObjectContext) private var context
    @Environment(\.presentationMode) var presentationMode
    
    @State var inputName = "Legg til navn"
    @State var inputImage = "Legg til bilde (url)"
    @State var inputInfo = "Legg til informasjon"
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Navn")){
                    TextField(text: $inputName){}
                }
                
                Section(header: Text("Bilde")){
                    HStack{
                        AsyncImage(url: URL(string: inputImage)){image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 75)
                        }placeholder: {
                            ProgressView()
                        }
                        TextField(text: $inputImage, axis: .vertical){}
                        
                    }
                }
                
                Section(header: Text("Informasjon")){
                    TextField(text: $inputInfo, axis: .vertical){}
                }
                
                
            }
            .navigationTitle("Rediger Ingrediens")
            .toolbar(content: {
                Button(action: {
                    handleSave()
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    HStack{
                        Image(systemName: "square.and.arrow.down.on.square.fill")
                        Text("Lagre")
                    }
                })
            })
        }
    }
    
    func handleSave(){
        let newIngredient = Ingredient(context: context)
        newIngredient.id = "\(inputName)\(arc4random())"
        newIngredient.name = inputName
        newIngredient.image = inputImage
        newIngredient.info = inputInfo
        newIngredient.archived = false
        newIngredient.date = nil
        
        do{
            try context.save()
        }catch let error{
            print(error)
        }
    }

}

#Preview {
    AddIngredientView()
}
