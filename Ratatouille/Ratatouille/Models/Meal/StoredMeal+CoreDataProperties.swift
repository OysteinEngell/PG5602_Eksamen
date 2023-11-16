//
//  StoredMeal+CoreDataProperties.swift
//  Ratatouille
//
//  Created by Øystein Engell on 16/11/2023.
//
//

import Foundation
import CoreData


extension StoredMeal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoredMeal> {
        return NSFetchRequest<StoredMeal>(entityName: "StoredMeal")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var category: String?
    @NSManaged public var area: String?
    @NSManaged public var instructions: String?
    @NSManaged public var image: String?
    @NSManaged public var tags: String?
    @NSManaged public var video: String?
    @NSManaged public var ingredients: [String]?
    @NSManaged public var measures: [String]?
    @NSManaged public var favorite: Bool
    @NSManaged public var archived: Bool

}

extension StoredMeal : Identifiable {

}
