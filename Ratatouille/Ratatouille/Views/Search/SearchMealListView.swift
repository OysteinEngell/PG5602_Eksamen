//
//  SearchMealListView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 17/11/2023.
//

import SwiftUI

struct SearchMealListView: View {
    @Environment(\.managedObjectContext) private var moc
    let mealAPIClient = MealAPIClient.live
    let meals: [SearchMealModel]
    @State var detailedMeals: [Meal] = []
    
    var body: some View {
        List{
            ForEach(Array(meals.enumerated()), id: \.element.id) { index, meal in
                NavigationLink(destination: MealDetailView(meal: detailedMeals[index])) {
                    SearchMealItemView(meal: meal)
                }
            
                
            }.onAppear{
                Task{
                    await fetchMeals()
                }
    }
        }
    }
    func fetchMeals() async{
        
        for meal in meals{
            do{
                let responseMeal = try await mealAPIClient.getMealById(meal.id)
                if(responseMeal != nil){
                    let result = ParseMeal().parseMealObject(meal: responseMeal!, context: moc)
                    detailedMeals.append(result)
                }
            }catch let error{
                print(error)
            }
        }
       
    }//FetchMeals
}

#Preview {
    SearchMealListView(meals: SearchMealModel.demoArray)
}
