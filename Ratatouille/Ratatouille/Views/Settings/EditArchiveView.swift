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
                                VStack{
                                    Text(area.name).bold()
                                    if(area.date != nil){
                                        Text("Akrivert: ")
                                    }
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
                                VStack{
                                    Text(category.title)
                                    if(category.date != nil){
                                        Text("Arkivert: ")
                                    }
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
                        ForEach(ingredients){ingredient in
                            if(ingredient.archived){
                                HStack{
                                    Text(ingredient.name)
                                    if(ingredient.date != nil){
                                        Text("Arkivert: ")
                                    }
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
                                VStack{
                                    Text(meal.title).bold()
                                    if(meal.date != nil){
                                        Text("Arkivert: ")
                                    }
                                }.swipeActions(edge: .trailing){
                                    Button(action: {
                                        handleDelete(meal: meal)
                                    }, label: {
                                        Label("", systemImage: "trash.fill").tint(.red)
                                    })
                                    Button(action: {
                                        handleRestore(meal: meal)
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
                        clearMealData()
                    }, label: {
                        HStack{
                            Image(systemName: "trash")
                            Text("Slett alle måltider i databasen")
                        }
                    }).tint(.red)
                    Button(action: {
                        clearIngredientData()
                    }, label: {
                        HStack{
                            Image(systemName: "trash")
                            Text("Slett alle ingredienser i databasen")
                        }
                    }).tint(.red)
                }
            }.navigationTitle("Arkiv")
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
    func clearMealData(){
        do{
            for meal in meals{
                viewContext.delete(meal)
            }
            try viewContext.save()
        }catch let error{
            print(error)
        }
    }
    func clearIngredientData(){
        do{
            for ingredient in ingredients{
                viewContext.delete(ingredient)
            }
            try viewContext.save()
        }catch let error{
            print(error)
        }
    }
}
    

#Preview {
    EditArchiveView()
}
