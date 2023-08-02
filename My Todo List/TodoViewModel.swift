//
//  TodoViewModel.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import Foundation
import SwiftUI
import CoreData

class TodoViewModel: ObservableObject {
    
    let viewContext: NSManagedObjectContext
    
    @Published var title: String = ""
    @Published var desc: String = ""
    @Published var items: [Todo] = []
    
    init() {
        let persistenceManager = PersistenceManager.shared
        // Store viewContext object from the persistence manager
        viewContext = persistenceManager.container.viewContext
        fetchData()
    }
    
    private func fetchData() {
        // Perform a fetch request to retrieve data from Core Data
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Todo.dueDate, ascending: true)]
        
        do {
            items = try viewContext.fetch(fetchRequest)
        } catch {
            // TODO: Handle error
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func addItem() {
        withAnimation {
            // Create new Todo object by assign the title & desc
            let newItem = Todo(context: viewContext)
            newItem.dueDate = Date()
            newItem.title = title
            newItem.desc = desc
            do {
                try viewContext.save()
                // Fetch the latest data and clear out the title & desc state
                fetchData()
                title = ""
                desc = ""
            } catch {
                // TODO: Handle error
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets
                .map { items[$0] }
                .forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // TODO: Handle error
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
