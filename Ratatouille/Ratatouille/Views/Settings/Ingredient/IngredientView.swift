

import SwiftUI

struct IngredientView: View {
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
                            EditIngredientView(ingredient: ingredient)
                        }label: {
                            HStack{
                                AsyncImage(url: URL(string: ingredient.image ?? "")){image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50)
                                }placeholder: {
                                    ProgressView()
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
            }
            .navigationTitle("Ingredienser")
            .toolbar{
                NavigationLink {
                    AddIngredientView()
                } label: {
                    Image(systemName: "plus.circle.fill").resizable().frame(width: 30, height: 30)
                }

            }
        }
    }
    func handleArchived(ingredient: Ingredient){
        ingredient.archived = true
        ingredient.date = Date()
    }
}

#Preview {
    IngredientView()
}
