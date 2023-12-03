

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }
    
    @nonobjc public class func fetchRequest(for id: String) -> NSFetchRequest<Ingredient> {
            let request: NSFetchRequest<Ingredient> = NSFetchRequest<Ingredient>(entityName: "Ingredient")
            request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
            return request
        }
    
    @nonobjc public class func fetchRequest(has name: String) -> NSFetchRequest<Ingredient> {
            let request: NSFetchRequest<Ingredient> = NSFetchRequest<Ingredient>(entityName: "Ingredient")
            request.predicate = NSPredicate(format: "name == %@", name as CVarArg)
            return request
        }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var info: String?
    @NSManaged public var image: String?
    @NSManaged public var archived: Bool
    @NSManaged public var date: Date?

}

extension Ingredient : Identifiable {

}
