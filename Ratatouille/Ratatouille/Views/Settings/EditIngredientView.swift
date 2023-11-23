//
//  EditIngredientView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct EditIngredientView: View {
    @FetchRequest(entity: Ingredient.entity(), sortDescriptors: [], predicate: NSPredicate(format: "archived == false"))
    var ingredients: FetchedResults<Ingredient>
    
    var body: some View {
        NavigationStack{
            
            List{
                if(ingredients.isEmpty){
                    Text("ingen ingredienser i databasen")
                }else{
                    ForEach(ingredients, id: \.self){ingredient in
                        NavigationLink{
                            Text("Ingredient details")
                        }label: {
                            HStack{
                                AsyncImage(url: URL(string: ingredient.image ?? "")){image in
                                    image.image?.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50)
                                }
                                Text(ingredient.name).bold()
                            }
                        }.swipeActions(edge: .trailing){
                            Button {
                                handleArchived(ingredient: ingredient)
                            } label: {
                                Label("Arkiver", systemImage: "archivebox.fill").tint(.blue)
                            }
                        }
                    }
                }
            }.navigationTitle("Ingredienser")
        }
    }
    func handleArchived(ingredient: Ingredient){
        ingredient.archived = true
        ingredient.date = Date()
    }
}

#Preview {
    EditIngredientView()
}
