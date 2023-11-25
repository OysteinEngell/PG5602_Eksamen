//
//  EditCategoryView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct CategoryView: View {
    @FetchRequest(entity: Category.entity(), sortDescriptors: [], predicate: NSPredicate(format: "archived == false"))
    var categories: FetchedResults<Category>
    
    var body: some View {
        NavigationStack{
            
            List{
                if(categories.isEmpty){
                    Text("Ingen kategorier i databasen")
                }else{
                    ForEach(categories){category in
                        NavigationLink{
                            EditCategoryView(category: category)
                        }label: {
                            HStack{
                                AsyncImage(url: URL(string: category.image ?? "")){image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 75)
                                    .cornerRadius(40)}placeholder: {
                                        ProgressView()
                                    }
                                Text(category.title).bold()
                            }
                        }.swipeActions(edge: .trailing){
                            Button {
                                handleArchived(category: category)
                            } label: {
                                Label("Arkiver", systemImage: "archivebox.fill").tint(.blue)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Kategorier")
            .toolbar{
                NavigationLink {
                    AddCategoryView()
                } label: {
                    Image(systemName: "plus.circle.fill").resizable().frame(width: 30, height: 30)
                }

            }
            
        }
    }
    
    func handleArchived(category: Category){
        category.archived = true
        category.date = Date()
    }
}

#Preview {
    CategoryView()
}
