//
//  StoredMealItemView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 20/11/2023.
//

import SwiftUI

struct StoredMealItemView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataContext: DataContext
    @State var favorite: Bool
    let meal: Meal
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: meal.image)){image in
                image.image?.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                    .cornerRadius(40)
            }
            VStack(alignment: .leading){
                Text(meal.title).bold().font(.title2)
                Text(meal.category)
            }
            Spacer()
            if(favorite){
                Image(systemName: "star.fill").foregroundColor(.green)
            }
            
        }.swipeActions(edge: .leading){
            Button(action: {
                handleFavorite()
            }, label: {
                Label("", systemImage: "star.fill").tint(.green)
            })
        }
        .swipeActions(edge: .trailing){
            Button(action: {
                handleArchived()
            }, label: {
                Label("", systemImage: "archivebox.fill").tint(.blue)
            })
        }
    }
    
    func handleFavorite(){
        withAnimation {
            meal.favorite.toggle()
            favorite.toggle()
            do{
               try viewContext.save()
            }catch let error{
                print(error)
            }
        }
    }
    
    func handleArchived(){
        withAnimation {
            meal.archived = true
            meal.date = Date()
            dataContext.numberOfMealsInStorage -= 1
            do{
               try viewContext.save()
            }catch let error{
                print(error)
            }
        }
    }
}

#Preview {
    StoredMealItemView(favorite: Meal.demo.favorite, meal: Meal.demo)
}
