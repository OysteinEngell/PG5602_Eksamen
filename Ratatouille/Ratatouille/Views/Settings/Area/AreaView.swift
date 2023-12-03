

import SwiftUI

struct AreaView: View {
    @FetchRequest(entity: Area.entity(), sortDescriptors: [], predicate: NSPredicate(format: "archived == false"))
    var areas: FetchedResults<Area>
    
    var body: some View {
        NavigationStack{
            
            List{
                if(areas.isEmpty){
                    Text("Ingen landområder i databasen")
                }else{
                    ForEach(areas){area in
                        if(area.archived == false){
                            NavigationLink{
                                EditAreaView(area: area)
                            }label: {
                                HStack{
                                    AsyncImage(url: URL(string: "https://flagsapi.com/\(area.flag ?? "AQ")/flat/32.png")){image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    Text(area.name).bold()
                                }
                            }.swipeActions(edge: .trailing){
                                Button {
                                    handleArchived(area: area)
                                } label: {
                                    Label("Arkiver", systemImage: "archivebox.fill").tint(.blue)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Landområder")
            .toolbar {
                NavigationLink{
                    AddAreaView()
                }label: {
                    Image(systemName: "plus.circle.fill").resizable().frame(width: 30, height: 30)
                }
            }
        }
    }
    func handleArchived(area: Area){
        area.archived = true
        area.date = Date()
    }
}

#Preview {
    AreaView()
}

