//
//  Meal+CoreDataProperties.swift
//  Ratatouille
//
//  Created by Øystein Engell on 17/11/2023.
//
//

import Foundation
import CoreData


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
