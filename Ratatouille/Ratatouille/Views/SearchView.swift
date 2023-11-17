//
//  SearchView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct SearchView: View {
    
    @State var selected = "area"
    
    var body: some View {
        VStack{
            Picker(selection: $selected, label: Text(""), content: {
                Image(systemName: "globe").tag("area")
                Image(systemName: "rectangle.3.group.bubble").tag("category")
                Image(systemName: "carrot.fill").tag("ingredient")
                Image(systemName: "magnifyingglass").tag("title")
                
            }).pickerStyle(.segmented)
            Spacer()
        }.padding()
    }
}

#Preview {
    SearchView()
}
