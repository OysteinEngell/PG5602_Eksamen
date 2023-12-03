//
//  EditIngredientView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 25/11/2023.
//

import SwiftUI

struct EditIngredientView: View {
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.presentationMode) var presentationMode
    var ingredient: Ingredient
    
    @State var inputName = ""
    @State var inputImage = ""
    @State var inputInfo = ""
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Navn")){
                    TextField(text: $inputName){}
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
                        TextField(text: $inputImage, axis: .vertical){}
                        
                    }
                }
                
                Section(header: Text("Informasjon")){
                    TextField(text: $inputInfo, axis: .vertical){}
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                }
                
                
            }
            .navigationTitle("Rediger Ingrediens")
            .toolbar(content: {
                Button(action: {
                    handleSave()
                }, label: {
                    HStack{
                        Image(systemName: "square.and.arrow.down.on.square.fill")
                        Text("Lagre")
                    }
                })
            })
        }
        .onAppear{
            inputName = ingredient.name
            inputImage = ingredient.image ?? ""
            inputInfo = ingredient.info ?? ""
        }
    }
    
    func handleSave(){
        if(InputValidator.validateName(name: inputName)){
            ingredient.name = inputName
            ingredient.image = inputImage
            ingredient.info = inputInfo
            do{
                try moc.save()
            }catch let error{
                print(error)
            }
        }
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    EditIngredientView(ingredient: Ingredient())
}
