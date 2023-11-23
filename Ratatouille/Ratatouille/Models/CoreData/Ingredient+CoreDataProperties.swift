//
//  Ingredient+CoreDataProperties.swift
//  Ratatouille
//
//  Created by Øystein Engell on 23/11/2023.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var info: String?
    @NSManaged public var image: String?
    @NSManaged public var archived: Bool
    @NSManaged public var date: Date?

}

extension Ingredient : Identifiable {

}
