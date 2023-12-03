//
//  EditCategoryView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 24/11/2023.
//

import SwiftUI

struct EditCategoryView: View {
    @Environment(\.managedObjectContext) private var moc
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
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
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
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                    }
                }
                
                Section(header: Text("Informasjon")){
                    TextField(text: $inputInfo, axis: .vertical){}
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                }
                
                Section(header: Text("Oppskrifter")){
                    if(category.mealsArray.isEmpty){
                        Text("Ingen oppskrifter lagret i denne kategorien")
                    }else{
                        ForEach(category.mealsArray){meal in
                            NavigationLink{
                                MealDetailView(meal: meal)
                            }label: {
                                HStack{
                                    AsyncImage(url: URL(string: meal.image)){image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50)
                                            .cornerRadius(40)
                                    }placeholder: {
                                        ProgressView().padding(20)
                                    }
                                    Text(meal.title)
                                }
                            }
                        }
                    }
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
        if(InputValidator.validateName(name: inputTitle)){
            category.title = inputTitle
            category.info = inputInfo
            category.image = inputInfo
            
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
    EditCategoryView(category: Category())
}
