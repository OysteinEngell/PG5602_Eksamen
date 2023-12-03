//
//  AddIngredientView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 25/11/2023.
//

import SwiftUI

struct AddIngredientView: View {
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State var inputName = ""
    @State var inputImage = ""
    @State var inputInfo = ""
    
    @State var nameFieldFocused = false
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Navn")){
                    TextField("Legg til navn", text: $inputName)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
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
                        TextField("Legg til bilde url", text: $inputImage, axis: .vertical)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                            
                    }
                }
                
                Section(header: Text("Informasjon")){
                    TextField("Legg til en beskrivelse", text: $inputInfo, axis: .vertical)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
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
        do{
            if let existingIngredient = try moc.fetch(Ingredient.fetchRequest(has: inputName)).first {
                print("\(inputName) already exists")
                existingIngredient.archived = false
            }else{
                if(InputValidator.validateName(name: inputName)){
                    let newIngredient = Ingredient(context: moc)
                    newIngredient.id = "\(inputName)\(arc4random())"
                    newIngredient.name = inputName
                    newIngredient.image = inputImage
                    newIngredient.info = inputInfo
                    newIngredient.archived = false
                    newIngredient.date = nil
                    
                    do{
                        try moc.save()
                    }catch let error{
                        print(error)
                    }
                }
                
            }
        }
        catch let error{
            print(error)
        }
    }

}

#Preview {
    AddIngredientView()
}
