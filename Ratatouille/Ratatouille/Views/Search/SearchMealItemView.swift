//
//  SearchMealItemView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 17/11/2023.
//

import SwiftUI

struct SearchMealItemView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataContext: DataContext
    let mealAPIClient = MealAPIClient.live
    let transformer = MealTransformer()
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
                        await handlePress(id: meal.id)
                    }
                }, label: {
                    Label("", systemImage: "square.grid.3x1.folder.fill.badge.plus").tint(.blue)
                })
            })
    }
    
    func handlePress(id: String) async{
        do{
            let responseMeal = try await mealAPIClient.getMealById(id)
            if((responseMeal != nil)){
                let storedMeal = transformer.parseMealObject(meal: responseMeal!, context: viewContext)
                dataContext.numberOfMealsInStorage += 1
                print("Stored:  \(storedMeal.title)")
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
