//
//  Meal+CoreDataProperties.swift
//  Ratatouille
//
//  Created by Øystein Engell on 17/11/2023.
//
//

import Foundation
import CoreData
import UIKit



extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var id: String
    @NSManaged public var archived: Bool
    @NSManaged public var area: String
    @NSManaged public var category: String
    @NSManaged public var favorite: Bool
    @NSManaged public var image: String?
    @NSManaged public var ingredients: [String]
    @NSManaged public var instructions: String?
    @NSManaged public var measures: [String]
    @NSManaged public var tags: String?
    @NSManaged public var title: String
    @NSManaged public var video: String?

}

extension Meal : Identifiable {

}

extension Meal {
    // ... existing code ...

    static var demo: Meal {
        let context = PersistenceController.shared.container.viewContext
        let demoMeal = Meal(context: context)
        demoMeal.id = "11111"
        demoMeal.archived = false
        demoMeal.area = "Demo Area"
        demoMeal.category = "Demo Category"
        demoMeal.favorite = false
        demoMeal.image = "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"
        demoMeal.ingredients = ["Ingredient1", "Ingredient2"]
        demoMeal.instructions = "Demo Instructions"
        demoMeal.measures = ["Measure1", "Measure2"]
        demoMeal.tags = "Demo Tags"
        demoMeal.title = "Demo Title"
        demoMeal.video = "demoVideo"
        return demoMeal
    }
}
