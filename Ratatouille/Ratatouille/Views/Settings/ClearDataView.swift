//
//  ClearDataViewswift.swift
//  Ratatouille
//
//  Created by Øystein Engell on 30/11/2023.
//

import SwiftUI
import CoreData

struct ClearDataView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(entity: Meal.entity(), sortDescriptors: [])
    var meals: FetchedResults<Meal>
    
    @FetchRequest(entity: Area.entity(), sortDescriptors: [])
    var areas: FetchedResults<Area>
    
    @FetchRequest(entity: Category.entity(), sortDescriptors: [])
    var categories: FetchedResults<Category>
    
    @FetchRequest(entity: Ingredient.entity(), sortDescriptors: [])
    var ingredients: FetchedResults<Ingredient>
    
    @State var confirmationAlertPresented = false
    @State var selectedEntity = ""
    
    var body: some View {
        Section(header: Text("Danger Zone")){
            
            Button(action: {
              selectedEntity = "matoppskrifter"
                confirmationAlertPresented = true
            }, label: {
                HStack{
                    Image(systemName: "trash")
                    Text("Slett alle måltider i databasen")
                }
            }).tint(.red)
            
            Button(action: {
                selectedEntity = "landområder"
                confirmationAlertPresented = true
            }, label: {
                HStack{
                    Image(systemName: "trash")
                    Text("Slett alle landområder i databasen")
                }
            }).tint(.red)
            
            Button(action: {
                selectedEntity = "kategorier"
                confirmationAlertPresented = true
            }, label: {
                HStack{
                    Image(systemName: "trash")
                    Text("Slett alle kategorier i databasen")
                }
            }).tint(.red)
            
            Button(action: {
                selectedEntity = "ingredienser"
                confirmationAlertPresented = true
            }, label: {
                HStack{
                    Image(systemName: "trash")
                    Text("Slett alle ingredienser i databasen")
                }
            }).tint(.red)
        }
        .alert(isPresented: $confirmationAlertPresented) {
            Alert(
            title: Text("Bekreft handling"),
            message: Text("Er du sikker på at du vil slette alle \(selectedEntity) fra databasen?"),
            primaryButton: .destructive(Text("Slett")){
                switch(selectedEntity){
                case "matoppskrifter": clearData(entities: meals)
                case "landområder": clearData(entities: areas)
                case "kategorier": clearData(entities: categories)
                case "ingredienser": clearData(entities: ingredients)
                default: return
                }
            }, secondaryButton: .cancel()
            )
        }
    }
    
    func clearData<T: NSManagedObject>(entities: FetchedResults<T>){
       
        do{
            for entity in entities{
                moc.delete(entity)
            }
            try moc.save()
        }catch let error{
            print(error)
        }
    }
}

#Preview {
    ClearDataView()
}
