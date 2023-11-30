//
//  EditAreaDetailView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 24/11/2023.
//

import SwiftUI

struct EditAreaView: View {
    @Environment(\.managedObjectContext) private var context
    @Environment(\.presentationMode) var presentationMode
    
    var area: Area
    
    @State var inputName = ""
    @State var inputFlag = ""
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Navn")){
                    TextField(text: $inputName) {}
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                }
                
                Section(header: Text("Landskode")){
                    HStack{
                        TextField("Landskode", text: $inputFlag){}
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                        Spacer()
                        AsyncImage(url: URL(string: "https://flagsapi.com/\(inputFlag)/flat/32.png")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
                Section(header: Text("Oppskrifter")){
                    if(area.mealsArray.isEmpty){
                        Text("Ingen oppskrifter lagret fra dette området")
                    }else{
                        ForEach(area.mealsArray){meal in
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
            .navigationTitle("Rediger landområde")
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
            inputName = area.name
            inputFlag = area.flag ?? "AQ"
        }
    }
    func handleSave(){
        area.name = inputName
        area.flag = inputFlag
        
        
        do{
            try context.save()
        }catch let error{
            print(error)
        }
        
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    EditAreaView(area: Area() )
}
