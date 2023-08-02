//
//  PersistanceManager.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import Foundation
import CoreData

class PersistenceManager {
    
    static let shared = PersistenceManager()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "TodoModel")
        container.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError("Error occured: \(String(describing: error))")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        
    }
    
}
