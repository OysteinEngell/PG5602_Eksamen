//
//  AddAreaView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 25/11/2023.
//

import SwiftUI

struct AddAreaView: View {
    
    @Environment(\.managedObjectContext) private var context
    @Environment(\.presentationMode) var presentationMode
    
    @State var inputName = ""
    @State var inputFlag = ""
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Navn")){
                    TextField(text: $inputName) {}
                }
                
                Section(header: Text("Landskode")){
                    HStack{
                        TextField("Landskode", text: $inputFlag)
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
        
    }
    func handleSave(){
        let newArea = Area(context: context)
        newArea.name = inputName
        newArea.flag = inputFlag
        newArea.archived = false
        newArea.date = nil
        newArea.id = "\(inputName)\(arc4random())"
        
        do{
            try context.save()
        }catch let error{
            print(error)
        }
        
        presentationMode.wrappedValue.dismiss()
    }
    
    
}

#Preview {
    AddAreaView()
}
