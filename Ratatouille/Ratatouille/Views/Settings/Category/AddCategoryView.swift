//
//  AddCategoryView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 25/11/2023.
//

import SwiftUI

struct AddCategoryView: View {
    @Environment(\.managedObjectContext) private var context
    @Environment(\.presentationMode) var presentationMode
    
    @State var inputTitle = "Legg til tittel"
    @State var inputInfo = "Legg til informasjon"
    @State var inputImage = "Legg til bilde (url)"
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Tittel")){
                    TextField(text: $inputTitle){}
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                }
                
                Section(header: Text("Bilde")){
                    HStack{
                        AsyncImage(url: URL(string: inputImage)){image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 75)
                            .cornerRadius(40)}placeholder: {
                                ProgressView()
                            }
                        TextField(text: $inputImage, axis: .vertical){}
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                    }
                }
                
                Section(header: Text("Informasjon")){
                    TextField(text: $inputInfo, axis: .vertical){}
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                }
            }
            .navigationTitle("Rediger kategori")
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
        let newCategory = Category(context: context)
        newCategory.id = "\(inputTitle)\(arc4random())"
        newCategory.title = inputTitle
        newCategory.image = inputImage
        newCategory.info = inputInfo
        newCategory.archived = false
        newCategory.date = nil
        
        do{
            try context.save()
        }catch let error{
            print(error)
        }
    }
}

#Preview {
    AddCategoryView()
}
