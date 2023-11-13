//
//  SearchView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct SearchView: View {
    
    @State var selected = 0
    
    var body: some View {
        VStack{
            Picker(selection: $selected, label: Text(""), content: {
                Image(systemName: "globe").tag(0)
                Image(systemName: "rectangle.3.group.bubble").tag(1)
                Image(systemName: "carrot.fill").tag(2)
                Image(systemName: "magnifyingglass").tag(3)
                
            }).pickerStyle(.segmented)
        }.padding()
    }
}

#Preview {
    SearchView()
}
