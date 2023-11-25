//
//  EditCategoryView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 24/11/2023.
//

import SwiftUI

struct EditCategoryView: View {
    @Environment(\.managedObjectContext) private var context
    @Environment(\.presentationMode) var presentationMode
    
    var category: Category
    
    @State var inputTitle = ""
    @State var inputInfo = ""
    @State var inputImage = ""
    
    
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Tittel")){
                    TextField(text: $inputTitle){}
                }
                
                Section(header: Text("Bilde")){
                    HStack{
                        AsyncImage(url: URL(string: category.image ?? "")){image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 75)
                            .cornerRadius(40)}placeholder: {
                                ProgressView()
                            }
                        TextField(text: $inputImage, axis: .vertical){}
                    }
                }
                
                Section(header: Text("Informasjon")){
                    TextField(text: $inputInfo, axis: .vertical){}
                }
            }
            .navigationTitle("Rediger kategori")
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
            inputTitle = category.title
            inputInfo = category.info ?? "Legg til informasjon"
            inputImage = category.image ?? "Legg til bilde(url)"
            
        }
    }
    
    func handleSave(){
        category.title = inputTitle
        category.info = inputInfo
        category.image = inputInfo
        
        do{
            try context.save()
        }catch let error{
            print(error)
        }
        
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    EditCategoryView(category: Category())
}
