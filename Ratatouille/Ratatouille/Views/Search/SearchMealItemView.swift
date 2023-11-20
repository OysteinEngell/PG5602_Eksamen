//
//  SearchMealItemView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 17/11/2023.
//

import SwiftUI

struct SearchMealItemView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let mealAPIClient = MealAPIClient.live
    let transformer = ParseMeal()
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
                    Task{
                        print("SwipeAction Registered on item id: \(meal.id)")
                        await handlePress(id: meal.id)
                    }
                }, label: {
                    Label("", systemImage: "square.grid.3x1.folder.fill.badge.plus").tint(.primary)
                })
            })
    }
    
    func handlePress(id: String) async{
        do{
            let responseMeal = try await mealAPIClient.getMealById(id)
            if((responseMeal != nil)){
                let result = transformer.parseMealObject(meal: responseMeal!, context: viewContext)
                
                do{
                   try viewContext.save()
                }catch let error{
                    print(error)
                }
            }
            
        }catch let error{
            print(error)
        }
    }
}

#Preview {
    SearchMealItemView(meal: SearchMealModel.demo)
}
