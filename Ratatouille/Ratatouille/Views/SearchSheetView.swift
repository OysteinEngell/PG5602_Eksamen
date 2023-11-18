//
//  SearchSheetView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 18/11/2023.
//

import SwiftUI

struct SearchSheetView: View {
    @Binding var searchTerm: String
    var areas: [AreaModel]
    var tabSelected: String
    
    func checkInput(){
        
    }
    
    var body: some View {
        VStack{
            HStack{
                
            }
            Picker(selection: $searchTerm, label: Text("Velg")) {
                ForEach(areas){ area in
                    Text(area.name).tag(area.name).font(.title)
                }
            }.pickerStyle(.menu)
        }
    }
}

#Preview {
    SearchSheetView(searchTerm: .constant("SearchTerm"), areas: AreaModel.demoArray, tabSelected: "Landområde")
}
