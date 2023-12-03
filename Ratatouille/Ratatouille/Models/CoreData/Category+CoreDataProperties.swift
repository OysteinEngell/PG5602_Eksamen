//
//  Category+CoreDataProperties.swift
//  Ratatouille
//
//  Created by Øystein Engell on 23/11/2023.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }
    
    @nonobjc public class func fetchRequest(for id: String) -> NSFetchRequest<Category> {
            let request: NSFetchRequest<Category> = NSFetchRequest<Category>(entityName: "Category")
            request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
            return request
        }
    
    @nonobjc public class func fetchRequest(has title: String) -> NSFetchRequest<Category> {
            let request: NSFetchRequest<Category> = NSFetchRequest<Category>(entityName: "Category")
            request.predicate = NSPredicate(format: "title == %@", title as CVarArg)
            return request
        }

    @NSManaged public var id: String
    @NSManaged public var title: String
    @NSManaged public var image: String?
    @NSManaged public var info: String?
    @NSManaged public var archived: Bool
    @NSManaged public var date: Date?
    @NSManaged public var meals: NSSet?
    
    public var mealsArray: [Meal] {
        let set = meals as? Set<Meal> ?? []
        
        return set.sorted {
            $0.title < $1.title
        }
    }

}

// MARK: Generated accessors for meals
extension Category {

    @objc(addMealsObject:)
    @NSManaged public func addToMeals(_ value: Meal)

    @objc(removeMealsObject:)
    @NSManaged public func removeFromMeals(_ value: Meal)

    @objc(addMeals:)
    @NSManaged public func addToMeals(_ values: NSSet)

    @objc(removeMeals:)
    @NSManaged public func removeFromMeals(_ values: NSSet)

}

extension Category : Identifiable {

}
