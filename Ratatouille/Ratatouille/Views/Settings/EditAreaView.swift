//
//  EditAreaView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct EditAreaView: View {
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
                                Text("Edit Area details")
                            }label: {
                                HStack{
                                    AsyncImage(url: URL(string: "https://flagsapi.com/\(area.flag ?? "AQ")/flat/32.png")){image in
                                        image.image?.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50)
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
            }.navigationTitle("Landområder")
        }
    }
    func handleArchived(area: Area){
        area.archived = true
        area.date = Date()
    }
}

#Preview {
    EditAreaView()
}

