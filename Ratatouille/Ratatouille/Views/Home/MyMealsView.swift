//
//  MyRecipesView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct MyMealsView: View {
    
    @EnvironmentObject var dataContext: DataContext
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(entity: Meal.entity(), sortDescriptors: [], predicate: NSPredicate(format: "archived == false"))
    var meals: FetchedResults<Meal>
  
    
    
    
    var body: some View {
        VStack{
            LogoView().background(Color(.main))
            Spacer()
            if meals.isEmpty {
                Image(systemName: "square.3.layers.3d.slash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                
                Text("Ingen matoppskrifter").bold()
                Spacer()
            } else {
                NavigationStack{
                    List{
                        ForEach(meals){meal in
                            if(meal.archived == false){
                                NavigationLink{
                                    MealDetailView(meal: meal).toolbar {
                                        NavigationLink{
                                            EditMealDetailView(meal: meal)
                                        }label: {
                                            HStack{
                                                Image(systemName: "pencil")
                                                Text("Rediger").bold()
                                            }.foregroundColor(.blue)
                                        }
                                        
                                    }
                                } label: {
                                    StoredMealItemView(favorite: meal.favorite, meal: meal)
                                }
                            }
                        }
                    }
                    .navigationBarTitle("Matoppskrifter")
                        
                }.offset(y: -10)
            }
        }.onAppear{
            
            dataContext.numberOfMealsInStorage = meals.count
            
        }
    }
}

#Preview {
    MyMealsView()
}
