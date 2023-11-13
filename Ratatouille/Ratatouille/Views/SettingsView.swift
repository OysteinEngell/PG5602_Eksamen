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
                            Text("Redigere landområder")
                        }
                        
                        NavigationLink{
                            EditCategoryView()
                        } label: {
                            Text("Redigere kategorier")
                        }
                        
                        NavigationLink{
                            EditIngredientView()
                        } label: {
                            Text("Redigere ingredienser")
                        }
                    }
                    Section{
                        HStack{
                            Text("Aktiver mørk modus")
                            Toggle("", isOn: $toggleDarkmode)
                        }
                    }
                    Section {
                        NavigationLink{
                            EditArchiveView()
                        } label: {
                            Text("Redigere ingredienser")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
