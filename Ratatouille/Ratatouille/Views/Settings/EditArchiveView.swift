//
//  EditArchiveView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct EditArchiveView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
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
                    Text("Matoppskrift")
                }
            }
            
            
            
        }.onAppear{
            
        }
    }
}

#Preview {
    EditArchiveView()
}
