

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkModeEnabled") private var isDarkmodeEnabled = false
    
   
    var body: some View {
        
        VStack{
            NavigationStack{
                List{
                    
                    Section{
                        NavigationLink{
                           AreaView()
                        } label: {
                            Image(systemName: "globe")
                            Text("Redigere landområder")
                        }
                        
                        NavigationLink{
                            CategoryView()
                        } label: {
                            Image(systemName: "rectangle.3.group.bubble")
                            Text("Redigere kategorier")
                        }
                        
                        NavigationLink{
                          IngredientView()
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
                            Toggle("", isOn: $isDarkmodeEnabled)
                                .frame(width: 50)
                               
                        }
                    }
                    Section {
                        NavigationLink{
                            ArchiveView()
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
