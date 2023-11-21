//
//  EditArchiveView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct EditArchiveView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Meal.entity(), sortDescriptors: [])
    var meals: FetchedResults<Meal>
    
    
    
    var body: some View {
        VStack{
            List{
                Section(header: Text("Arkiv").font(.title).bold().foregroundStyle(.black)){}
                Section(header: Text("Landområder")){
                    Text("Landområde")
                }
                Section(header: Text("Kategorier")){
                    Text("Kategori")
                }
                Section(header: Text("Ingredienser")){
                    Text("Ingrediens")
                }
                Section(header: Text("Matoppskrifter")){
                    if meals.contains(where: { $0.archived }){
                        ForEach(meals){meal in
                            if(meal.archived){
                                Text(meal.title).swipeActions(edge: .trailing){
                                    Button(action: {
                                        handleDelete(meal: meal)
                                    }, label: {
                                        Label("", systemImage: "trash.fill").tint(.red)
                                    })
                                    Button(action: {
                                        handleRestore(meal: meal)
                                    }, label: {
                                        Label("", systemImage: "tray.and.arrow.up.fill").tint(.blue)
                                    })
                                }
                            }
                        }
                    }else{
                        HStack{
                            Image(systemName: "fork.knife.circle.fill").foregroundColor(.blue)
                            Text("Ingen arkiverte matoppskrifter").foregroundStyle(.blue)
                        }
                    }
                }
                Section{
                    Button(action: {
                        handleClearData()
                    }, label: {
                        HStack{
                            Image(systemName: "trash")
                            Text("Tøm databasen for matoppskrifter")
                        }
                       
                    }).tint(.red)
                }
            }
        }.onAppear{
        }
    }
    func handleDelete(meal: Meal){
        viewContext.delete(meal)
        do{
            try viewContext.save()
        }catch let error{
            print(error)
        }
    }
    
    func handleRestore(meal: Meal){
        meal.archived = false
        do{
            try viewContext.save()
        }catch let error{
            print(error)
        }
    }
    
    func handleClearData() {
        do {
            meals.forEach { meal in
                viewContext.delete(meal)
            }
            try viewContext.save()
        } catch {
            // Handle error appropriately
            print("Failed to clear data: \(error)")
        }
    }
}
    

#Preview {
    EditArchiveView()
}
