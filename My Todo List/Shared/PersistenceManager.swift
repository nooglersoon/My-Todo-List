//
//  PersistanceManager.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import Foundation
import CoreData

class PersistenceManager {
    
    // Shared initialization to implement singleton pattern
    static let shared = PersistenceManager()
    
    // Mock data for preview and test purpose
    static var preview: PersistenceManager = {
        let result = PersistenceManager()
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Todo(context: viewContext)
            newItem.title = "Mock"
            newItem.dueDate = Date()
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    let container: NSPersistentContainer
    
    // Defined as private to prevent PersistenceManager initialization outside this class
    private init() {
        container = NSPersistentContainer(name: "TodoModel")
        container.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError("Error occured: \(String(describing: error))")
            }
        }
        
        // Help merge the data automatically
        container.viewContext.automaticallyMergesChangesFromParent = true
        
    }
    
}
