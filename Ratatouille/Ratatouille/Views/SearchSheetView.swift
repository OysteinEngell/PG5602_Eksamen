//
//  SearchSheetView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 18/11/2023.
//

import SwiftUI

struct SearchSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var searchTerm: String
    var areas: [AreaModel]
    @State var tabSelected: String
    
    func checkInput(){
        
    }
    
    var body: some View {
        VStack{
            HStack{
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Avbryt")
                })
                
                Spacer()
                
                Text(tabSelected)
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Søk")
                })
            }.padding()
            
            
            Picker(selection: $searchTerm, label: Text("Velg")) {
                ForEach(areas){ area in
                    Text(area.name).tag(area.name).font(.title)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    SearchSheetView(searchTerm: .constant("SearchTerm"), areas: AreaModel.demoArray, tabSelected: "Landområde")
}
