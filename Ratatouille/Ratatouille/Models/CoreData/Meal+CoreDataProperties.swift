

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }
    
    @nonobjc public class func fetchRequest(for id: String) -> NSFetchRequest<Meal> {
            let request: NSFetchRequest<Meal> = NSFetchRequest<Meal>(entityName: "Meal")
            request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
            return request
        }

    @NSManaged public var archived: Bool
    @NSManaged public var area: String
    @NSManaged public var category: String
    @NSManaged public var favorite: Bool
    @NSManaged public var id: String
    @NSManaged public var image: String
    @NSManaged public var ingredients: [String]
    @NSManaged public var instructions: String?
    @NSManaged public var measures: [String]
    @NSManaged public var title: String
    @NSManaged public var video: String?
    @NSManaged public var date: Date?
    @NSManaged public var inCategory: Category?
    @NSManaged public var fromArea: Area?

}

extension Meal : Identifiable {

}

extension Meal {
    
    static var demo: Meal{
        let moc = PersistenceController.shared.container.viewContext
        let meal = Meal(context: moc)
        meal.id = "54605"
        meal.title = "Delicous demomeal"
        meal.area = "Italian"
        meal.category = "Beef"
        meal.image = "https://www.themealdb.com/images/media/meals/cgl60b1683206581.jpg"
        meal.instructions = "Do all the stuff"
        meal.ingredients = ["Meat", "Vegetables"]
        meal.measures = ["A lot of", "500g"]
        meal.archived = false
        meal.favorite = false
        meal.date = nil
        meal.video = "https://www.youtube.com/watch?v=jxW3Lj8VjyE"
        return meal
    }
}
