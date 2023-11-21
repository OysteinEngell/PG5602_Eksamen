//
//  MealDetailView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 20/11/2023.
//

import SwiftUI

struct MealDetailView: View {
    @Environment(\.managedObjectContext) private var moc
    let mealAPIClient = MealAPIClient.live
    var id: String
    @State var meal: Meal? = nil
    
    var body: some View {
        VStack{
            if(meal == nil){
                Text("Loading...")
            }else{
                ScrollView{
                    AsyncImage(url: URL(string: meal?.image ?? "")){image in
                        image.image?.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 420)
                    }
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text(meal!.title).font(.title).bold()
                            Text(meal!.category)
                        }
                        Spacer()
                    }.padding(EdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 30))
                    
                    VStack{
                        HStack{
                            Text("Ingredienser").bold().font(.title3).padding(.bottom)
                            Spacer()
                        }
                        
                        HStack{
                            VStack(alignment: .leading){
                                ForEach(meal!.measures, id: \.self){measure in
                                    Text(measure)
                                    Divider()
                                }
                            }
                            VStack(alignment: .leading){
                                ForEach(meal!.ingredients, id: \.self){ingredient in
                                    Text(ingredient)
                                    Divider()
                                }
                            }
                            Spacer()
                            
                        }
                        
                    }.padding(EdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 30))
                    
                    if(meal!.instructions != nil){
                        
                        HStack{
                            
                            VStack(alignment: .leading){
                                Text("Instruksjoner").bold().font(.title3).padding(.bottom)
                                
                                Text(meal!.instructions ?? "")
                            }
                            Spacer()
                        }.padding(EdgeInsets(top: 0, leading: 30, bottom: 50, trailing: 30))
                    }
                    
                    VStack{
                        
                    }.frame(height: 100)
                    
                    
                    
                }.ignoresSafeArea(.container)
                
            }
        }.onAppear{
            print("onappear")
            Task{
//                await fetchMeal()
            }
        }
    }
 
    
    func mealExists() -> Bool{
        @FetchRequest(entity: Meal.entity(), sortDescriptors: [])
        var meals: FetchedResults<Meal>
        
        if let existingMeal = meals.first(where: { $0.id == id }) {
            meal = existingMeal
            print("meal exists")
            return true
        }
        return false
    }
    
    func fetchMeal() async{
        if(!mealExists()){
            do{
                let response = try await mealAPIClient.getMealById(id)
                if(response != nil){
                    meal = ParseMeal().parseMealObject(meal: response!, context: moc)
                }
                
            }catch let error{
                print(error)
            }
        }
    }
}

#Preview {
    MealDetailView(id: "1111")
}
