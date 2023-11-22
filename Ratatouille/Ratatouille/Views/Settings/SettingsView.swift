//
//  SettingsView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct SettingsView: View {
    @State var toggleDarkmode = false
   
    var body: some View {
        
        VStack{
            NavigationStack{
                List{
                    
                    Section{
                        NavigationLink{
                            EditAreaView()
                        } label: {
                            Image(systemName: "globe")
                            Text("Redigere landområder")
                        }
                        
                        NavigationLink{
                            EditCategoryView()
                        } label: {
                            Image(systemName: "rectangle.3.group.bubble")
                            Text("Redigere kategorier")
                        }
                        
                        NavigationLink{
                            EditIngredientView()
                        } label: {
                            Image(systemName: "carrot.fill")
                            Text("Redigere ingredienser")
                        }
                    }
                    Section{
                        HStack{
                            Image(systemName: "moon.circle")
                            Text("Aktiver mørk modus")
                            Spacer()
                            Toggle("", isOn: $toggleDarkmode).frame(width: 50)
                        }
                    }
                    Section {
                        NavigationLink{
                            EditArchiveView()
                        } label: {
                            Image(systemName: "archivebox.fill")
                            Text("Redigere arkiv")
                        }
                    }
                }.foregroundColor(.blue).navigationTitle("Innstillinger")
            }
        }
    }
}

#Preview {
    SettingsView()
}
