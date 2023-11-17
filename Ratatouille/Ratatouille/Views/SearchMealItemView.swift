//
//  SearchMealItemView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 17/11/2023.
//

import SwiftUI

struct SearchMealItemView: View {
    var meal: SearchMealModel
    
    var body: some View {
            HStack{
                AsyncImage(url: URL(string: meal.image)){image in
                    image.image?.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .cornerRadius(40)
                }
                Text(meal.title).bold()
            }.swipeActions(edge: .trailing, content: {
                Button(action: {
                    print("SwipeAction Registered on item id: \(meal.id)")
                }, label: {
                    Label("", systemImage: "archivebox.fill").tint(.primary)
                })
            })
    }
}

#Preview {
    SearchMealItemView(meal: SearchMealModel.demo)
}
