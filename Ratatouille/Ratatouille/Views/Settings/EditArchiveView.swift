//
//  EditArchiveView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI
import CoreData

struct EditArchiveView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataContext: DataContext
    
    @FetchRequest(entity: Meal.entity(), sortDescriptors: [])
    var meals: FetchedResults<Meal>
    
    @FetchRequest(entity: Area.entity(), sortDescriptors: [])
    var areas: FetchedResults<Area>
    
    @FetchRequest(entity: Category.entity(), sortDescriptors: [])
    var categories: FetchedResults<Category>
    
    @FetchRequest(entity: Ingredient.entity(), sortDescriptors: [])
    var ingredients: FetchedResults<Ingredient>
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Landområder")){
                    if areas.contains(where: {$0.archived}){
                        ForEach(areas){area in
                            if(area.archived){
                                VStack(alignment: .leading){
                                    Text(area.name).bold()
                                    Text("Akrivert: \(area.date!, formatter: itemFormatter)")
                                }.swipeActions(edge: .trailing){
                                    Button(action: {
                                        handleDelete(entity: area)
                                    }, label: {
                                        Label("", systemImage: "trash.fill").tint(.red)
                                    })
                                    Button(action: {
                                        handleRestore(entity: area)
                                    }, label: {
                                        Label("", systemImage: "tray.and.arrow.up.fill")
                                    })
                                }
                            }
                        }
                    }else{
                        HStack{
                            Image(systemName: "globe")
                            Text("Ingen arkiverte landområder")
                        }.foregroundColor(.blue)
                    }
                    
                   
                }
                Section(header: Text("Kategorier")){
                    if categories.contains(where: {$0.archived}){
                        ForEach(categories){category in
                            if(category.archived){
                                
                                VStack(alignment: .leading){
                                    Text(category.title).bold()
                                    Text("Arkivert: \(category.date!, formatter: itemFormatter)")
                                }.swipeActions(edge: .trailing){
                                    Button(action: {
                                        handleDelete(entity: category)
                                    }, label: {
                                        Label("", systemImage: "trash.fill").tint(.red)
                                    })
                                    Button(action: {
                                        handleRestore(entity: category)
                                    }, label: {
                                        Label("", systemImage: "tray.and.arrow.up.fill")
                                    })
                                }
                            }
                        }
                    }else{
                        HStack{
                            Image(systemName: "rectangle.3.group.bubble")
                            Text("Ingen arkiverte kategorier")
                        }.foregroundColor(.blue)
                    }
                }
                Section(header: Text("Ingredienser")){
                    if ingredients.contains(where: {$0.archived}){
                        ForEach(ingredients, id: \.self){ingredient in
                            if(ingredient.archived){
                                VStack(alignment: .leading){
                                    Text(ingredient.name).bold()
                                  
                                    Text("Arkivert: \(ingredient.date!, formatter: itemFormatter)")
                                    
                                }.swipeActions(edge: .trailing){
                                    Button(action: {
                                        handleDelete(entity: ingredient)
                                    }, label: {
                                        Label("", systemImage: "trash.fill").tint(.red)
                                    })
                                    Button(action: {
                                        handleRestore(entity: ingredient)
                                    }, label: {
                                        Label("", systemImage: "tray.and.arrow.up.fill")
                                    })
                                }
                            }
                        }
                    }else{
                        HStack{
                            Image(systemName: "carrot.fill")
                            Text("Ingen arkiverte ingredienser")
                        }.foregroundColor(.blue)
                    }
                    
                }
                Section(header: Text("Matoppskrifter")){
                    if meals.contains(where: { $0.archived }){
                        ForEach(meals){meal in
                            if(meal.archived){
                                VStack(alignment: .leading){
                                    Text(meal.title).bold()
                              
                                    Text("Arkivert: \(meal.date!, formatter: itemFormatter)")
                                  
                                }.swipeActions(edge: .trailing){
                                    Button(action: {
                                        handleDelete(entity: meal)
                                    }, label: {
                                        Label("", systemImage: "trash.fill").tint(.red)
                                    })
                                    Button(action: {
                                        handleRestore(entity: meal)
                                        dataContext.numberOfMealsInStorage += 1
                                    }, label: {
                                        Label("", systemImage: "tray.and.arrow.up.fill")
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
                Section(header: Text("Danger Zone")){
                    Button(action: {
                        clearData(entities: meals)
                    }, label: {
                        HStack{
                            Image(systemName: "trash")
                            Text("Slett alle måltider i databasen")
                        }
                    }).tint(.red)
                    Button(action: {
                        
                    }, label: {
                        HStack{
                            Image(systemName: "trash")
                            Text("Slett alle ingredienser i databasen")
                        }
                    }).tint(.red)
                }
            }.navigationTitle("Arkiv")
        }
    }
    
    func handleDelete<T: NSManagedObject>(entity: T){
        viewContext.delete(entity as NSManagedObject)
        do{
            try viewContext.save()
        }catch let error{
            print(error)
        }
    }
    
    func handleRestore<T: NSManagedObject>(entity: T){
        do{
            if let archivableEntity = entity as NSManagedObject? {
                archivableEntity.setValue(false, forKey: "archived")
            }
            try viewContext.save()
        }catch let error{
            print(error)
        }
    }
    
    func clearData<T: NSManagedObject>(entities: FetchedResults<T>){
        do{
            for entity in entities{
                viewContext.delete(entity)
            }
            try viewContext.save()
        }catch let error{
            print(error)
        }
    }
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
}
    

#Preview {
    EditArchiveView()
}
