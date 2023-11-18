//
//  SearchByCategoryView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 18/11/2023.
//

import SwiftUI

struct SearchByCategoryView: View {
    @ObservedObject var dataContext: DataContext
    let mealAPIClient = MealAPIClient.live
    
    @State var sheetPresented = false
    
    var body: some View {
        VStack{
            HStack{
                
                VStack(alignment: .leading){
                    Text("Kategori: \(dataContext.selectedCategory.title)").font(.title).bold()
                    Text(dataContext.selectedCategory.info)
                    
                }.padding()
                
                AsyncImage(url: URL(string: dataContext.selectedCategory.image)){image in
                    image.image?.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 125)
                    .cornerRadius(40)}
                
            }
            
            
            SearchMealListView(meals: dataContext.categoryFilteredMealArray)
            
            Button(action: {
                sheetPresented = true
            }, label: {
                ZStack{
                    Rectangle().frame(width: 250, height: 50).cornerRadius(30).foregroundColor(.primary)
                    Text("Velg kategori").foregroundStyle(.white).bold()
                }.padding(.vertical)
            })
            
            
        }.pickerStyle(.wheel)
        
            .sheet(isPresented: $sheetPresented){
                
                    
                    List{
                        Section{
                            Text("Velg en kategori")
                        }
                        Section{
                            ForEach(dataContext.categoryArray){category in
                                Button(action: {
                                    handleChange(category: category)
                                    sheetPresented = false
                                }, label: {
                                    HStack{
                                        AsyncImage(url: URL(string: category.image)){image in
                                            image.image?.resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100)
                                            .cornerRadius(40)}
                                        VStack{
                                            Text(category.title).font(.title2).foregroundStyle(.primary).bold()
                                        }
                                        Spacer()
                                    }
                                })
                            }
                        }
                    }
                
                
                
                
                //        .onChange(of: dataContext.selectedCategory) { oldValue, newValue in
                //            handleChange()
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
    SearchByCategoryView(dataContext: DataContext())
}
