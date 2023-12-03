

import SwiftUI

struct SearchView: View {
    
    
    var mealApiClient = MealAPIClient.live
    
    @State var tabSelected = "Landområde"
    @State var sheetPresented = false
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .main
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.text], for: .selected)
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Picker(selection: $tabSelected, label: Text(""), content: {
                    Image(systemName: "globe").tag("Landområde")
                    Image(systemName: "rectangle.3.group.bubble").tag("Kategori")
                    Image(systemName: "carrot.fill").tag("Ingrediens")
                    Image(systemName: "magnifyingglass").tag("Navn")
                    
                })
                .pickerStyle(.segmented)
                .padding()
                
                switch(tabSelected){
                case "Landområde": SearchByAreaView()
                case "Kategori": SearchByCategoryView()
                case "Ingrediens": SearchByIngredientView()
                case "Navn": SearchByNameView()
                    
                default: SearchMealListView(meals: [])
                }
                
                Spacer()
            }
        }
    }
}



#Preview {
    SearchView()
}
