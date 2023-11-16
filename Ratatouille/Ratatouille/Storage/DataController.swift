//
//  DataController.swift
//  Ratatouille
//
//  Created by Øystein Engell on 16/11/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error)
            }
            print(description)
        }
    }
    
    static let shared = DataController()
}
