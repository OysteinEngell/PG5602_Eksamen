//
//  Area+CoreDataProperties.swift
//  Ratatouille
//
//  Created by Øystein Engell on 23/11/2023.
//
//

import Foundation
import CoreData


extension Area {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Area> {
        return NSFetchRequest<Area>(entityName: "Area")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var flag: String?
    @NSManaged public var archived: Bool
    @NSManaged public var date: Date?
    @NSManaged public var meals: NSSet?

}

// MARK: Generated accessors for meals
extension Area {

    @objc(addMealsObject:)
    @NSManaged public func addToMeals(_ value: Meal)

    @objc(removeMealsObject:)
    @NSManaged public func removeFromMeals(_ value: Meal)

    @objc(addMeals:)
    @NSManaged public func addToMeals(_ values: NSSet)

    @objc(removeMeals:)
    @NSManaged public func removeFromMeals(_ values: NSSet)

}

extension Area : Identifiable {

}
