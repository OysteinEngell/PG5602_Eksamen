//
//  EditCategoryView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 24/11/2023.
//

import SwiftUI

struct EditCategoryView: View {
    var category: Category
    
    @State var inputTitle = ""
    @State var inputDescription = ""
    @State var inputImage = ""
    
    
    
    var body: some View {
        NavigationStack{
            List{
//                TextField()
            }
            .navigationTitle("Rediger kategori")
            .toolbar(content: {
                Button(action: {
                    print("save")
                }, label: {
                    HStack{
                        Image(systemName: "square.and.arrow.down.on.square.fill")
                        Text("Lagre")
                    }
                })
            })
        }
        .onAppear{
            inputTitle = category.title
            inputDescription = category.info ?? "Legg til informasjon"
        }
    }
}

#Preview {
    EditCategoryView(category: Category())
}
