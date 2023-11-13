//
//  MyRecipesView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct MyRecipesView: View {
    var body: some View {
        VStack{
            Image(systemName: "square.3.layers.3d.slash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
            
            Text("Ingen matoppskrifter").bold()
            
            List{
                Text("Oppskrift").swipeActions(edge: .trailing){
                    Button {
                        print("leading")
                    } label: {
                        Label("", systemImage: "archivebox.fill")
                    }.tint(.accentColor)
                }
            }
        }
    }
}

#Preview {
    MyRecipesView()
}
