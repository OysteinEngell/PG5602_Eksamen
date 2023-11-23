//
//  EditAreaView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct EditAreaView: View {
    @FetchRequest(entity: Area.entity(), sortDescriptors: [])
    var areas: FetchedResults<Area>
    
    var body: some View {
        NavigationStack{
            
            List{
                if(areas.isEmpty){
                    Text("Ingen landområder i databasen")
                }else{
                    ForEach(areas){area in
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
                        }
                            
                        
                    }
                }
            }.navigationTitle("Landområder")
        }
    }
}

#Preview {
    EditAreaView()
}

