//
//  EditMealDetailView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 24/11/2023.
//

import SwiftUI

struct EditMealDetailView: View {
    
    
    @FetchRequest(entity: Area.entity(), sortDescriptors: [])
    var areas: FetchedResults<Area>
    
    @FetchRequest(entity: Category.entity(), sortDescriptors: [])
    var categories: FetchedResults<Category>
    
//    @FetchRequest(entity: Ingredient.entity(), sortDescriptors: [])
//    var ingredients: FetchedResults<Ingredient>
    
    @State var sheetPresented = false
    @State var sheetType = ""
    
    var meal: Meal
    @State var inputTitle = ""
    @State var inputImage = ""
    @State var inputArea = ""
    @State var areaCode = ""
    @State var inputCategory = ""
    @State var inputIngredients: [String] = []
    @State var inputMeasures: [String] = []
    @State var inputInstructions = ""
    
    @State var selectedIngredient = ""
    @State var selectedIngredientIndex = 0
    @State var selectedMeasure = ""
    @State var selectedMeasureIndex = 0
    
    @State var ingredientItems: [Ingredient] = []
    
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Tittel")){
                    TextField(text: $inputTitle) {}
                }
                Section(header: Text("Bilde")){
                    HStack{
                        AsyncImage(url: URL(string: meal.image)){image in
                            image.image?.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                                .cornerRadius(10)
                        }
                        TextField(text: $inputImage, axis: .vertical) {}
                    }
                }
                Section(header: Text("Landområde")){
                    HStack{
                        Picker("", selection: $inputArea) {
                            ForEach(areas){area in
                                Text(area.name).tag(area.name)
                            }
                        }.frame(width: 160, alignment: .leading)
                            .labelsHidden()
                        Spacer()
                        AsyncImage(url: URL(string: "https://flagsapi.com/\(areaCode)/flat/32.png")){image in
                            image.image?.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35)
                        }
                    }
                }
                Section(header: Text("Kategori")){
                    HStack{
                        Picker("", selection: $inputCategory) {
                            ForEach(categories){category in
                                Text(category.title).tag(category.title)
                            }
                        }.frame(width: 160, alignment: .leading)
                            .labelsHidden()
                        Spacer()
                        AsyncImage(url: URL(string: "https://www.themealdb.com/images/category/\(inputCategory).png")){image in
                            image.image?.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35)
                        }
                    }
                }
                
                Section(header: Text("Ingredienser")){
                    ForEach(inputIngredients.indices, id: \.self) { index in
                        
                        Button{
                            selectedIngredient = inputIngredients[index]
                            selectedIngredientIndex = index
                            if(index < inputMeasures.count){
                                selectedMeasure = inputMeasures[index]
                                selectedMeasureIndex = index
                            }
                            sheetPresented = true
                        }label: {
                            HStack {
                                Image(systemName: "pencil")
                                Text(inputIngredients[index])
                                Spacer()
                                if(index < inputMeasures.count){
                                    Text(inputMeasures[index])
                                }
                            }
                        }
                    }
                    Button {
                        addIngredient()
                    } label: {
                        HStack{
                            Image(systemName: "plus.circle.fill")
                            Text("Legg til ingrediens")
                        }
                    }
                }
                
                Section(header: Text("Instruksjoner")){
                    TextField(text: $inputInstructions, axis: .vertical){
                        
                    }
                }
                .sheet(isPresented: $sheetPresented){
                    SelectIngredientView(selectedIngredient: $selectedIngredient, inputMeasure: $selectedMeasure)
                }.presentationDetents([.medium])
                
            }
            .navigationTitle("Rediger oppskrift")
            .toolbar {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "square.and.arrow.down.on.square.fill")
                    Text("Lagre")
                })
            }
        }.onAppear{
           loadData()
//            linkIngredientItems()
        }
        .onChange(of: inputArea) { oldValue, newValue in
            areaCode = FlagAPI.countryCode(for: newValue)
        }
        
        .onChange(of: selectedIngredient){
            inputIngredients[selectedIngredientIndex] = selectedIngredient
        }
        
        .onChange(of: selectedMeasure) {
            inputMeasures[selectedMeasureIndex] = selectedMeasure
        }
    }
    
    
    func addIngredient(){
        
        selectedIngredient = ""
        selectedMeasure = ""
        sheetPresented = true
        
    }
    
    func loadData(){
        inputTitle = meal.title
        inputImage = meal.image
        inputArea = meal.area
        inputCategory = meal.category
        inputIngredients = meal.ingredients
        inputMeasures = meal.measures
        inputInstructions = meal.instructions ?? "Legg til instruksjoner"
    }
    
    func linkIngredientItems(){
//        ingredientItems = inputIngredients.compactMap{name in
//            ingredients.first { ingredient in
//                ingredient.name == name
//            }
//        }
    }
}

#Preview {
    EditMealDetailView(meal: Meal.demo)
}
