//
//  EditCategoryView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct EditCategoryView: View {
    @FetchRequest(entity: Category.entity(), sortDescriptors: [])
    var categories: FetchedResults<Category>
    
    var body: some View {
        NavigationStack{
            
            List{
                if(categories.isEmpty){
                    Text("Ingen kategorier i databasen")
                }else{
                    ForEach(categories){category in
                        NavigationLink{
                            Text("edit category details")
                        }label: {
                            HStack{
                                AsyncImage(url: URL(string: category.image ?? "")){image in
                                    image.image?.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 75)
                                    .cornerRadius(40)}
                                Text(category.title).bold()
                            }
                        }
                    }
                }
                    
                }.navigationTitle("Kategorier")
            
        }
    }
}

#Preview {
    EditCategoryView()
}
