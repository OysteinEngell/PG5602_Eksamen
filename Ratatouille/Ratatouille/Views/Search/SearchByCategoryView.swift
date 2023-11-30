//
//  SearchByCategoryView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 18/11/2023.
//

import SwiftUI

struct SearchByCategoryView: View {
    @EnvironmentObject var dataContext: DataContext
    let mealAPIClient = MealAPIClient.live
    
    @State var sheetPresented = false
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    AsyncImage(url: URL(string: dataContext.selectedCategory.image)){image in
                        image.image?.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                        .cornerRadius(40)}
                    
                        Text("Kategori: \(dataContext.selectedCategory.title)").font(.title).bold()
                }.padding(.horizontal)
                
                ScrollView{
                    Text(dataContext.selectedCategory.info)
                }.padding()
            }.frame(height: 200)
            
            SearchMealListView(meals: dataContext.categoryFilteredMealArray)
            
            Button(action: {
                sheetPresented = true
            }, label: {
                ZStack{
                    Rectangle().frame(width: 250, height: 50).cornerRadius(30).foregroundColor(Color("Main"))
                    Text("Velg kategori").foregroundStyle(Color("Text")).bold()
                }.padding(.vertical)
            })
        }
        
        .sheet(isPresented: $sheetPresented){
            NavigationStack{
                List{
                    Section{
                        ForEach(dataContext.categoryArray){category in
                            Button(action: {
                                handleChange(category: category)
                                sheetPresented = false
                            }, label: {
                                HStack{
                                    AsyncImage(url: URL(string: category.image)){image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 75)
                                        .cornerRadius(40)}placeholder: {
                                            ProgressView().padding(20)
                                        }.padding(.trailing, 20)
                                    VStack{
                                        Text(category.title).font(.title2).foregroundStyle(.primary).bold()
                                    }
                                    Spacer()
                                }
                            })
                        }
                    }
                }.navigationTitle("Velg en kategori")
            }
        }
    }
    
    func handleChange(category: CategoryModel){
        dataContext.selectedCategory = category
        Task{
            dataContext.categoryFilteredMealArray = try await mealAPIClient.getMealsByCategory(dataContext.selectedCategory.title)
        }
    }
}

#Preview {
    SearchByCategoryView()
}
