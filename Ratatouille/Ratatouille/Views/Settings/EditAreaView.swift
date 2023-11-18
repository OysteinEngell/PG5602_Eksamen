//
//  EditAreaView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct EditAreaView: View {
    @State var state = false
    var body: some View {
        
        VStack{
            Text("Rediger landområder")
            Button {
                state = true
            } label: {
                Text("button")
            }
            .sheet(isPresented: $state) {
                Text("sheet")
            }.presentationDetents([.medium])
        }
    }
}

#Preview {
    EditAreaView()
}
