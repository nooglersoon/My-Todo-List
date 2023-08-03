//
//  TodoViewModel.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import Foundation
import SwiftUI
import CoreData

// This model is to help differentiate between object entity and data model
struct TodoModel {
    let title: String
    let desc: String?
    let date: Date
}

class TodoViewModel: ObservableObject {
    
    private(set) var viewContext: NSManagedObjectContext
    
    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
    }
    
    func addItem(_ todo: TodoModel) {
        withAnimation {
            // Create new Todo object by assign the title & desc
            let newItem = Todo(context: viewContext)
            newItem.id = UUID()
            newItem.dueDate = todo.date
            newItem.title = todo.title
            newItem.desc = todo.desc
            saveItem()
        }
    }
    
    func deleteItems(items: FetchedResults<Todo>, offsets: IndexSet) {
        withAnimation {
            // Delete related item
            offsets
                .map { items[$0] }
                .forEach(viewContext.delete)
            saveItem()
        }
    }
    
    func updateItem(todo: Todo, with model: TodoModel) {
        withAnimation {
            // Update related item
            todo.title = model.title
            todo.desc = model.desc
            todo.dueDate = model.date
            saveItem()
        }
    }
    
    func saveItem() {
        // Safely save the data to viewContext
        do {
            try viewContext.save()
        } catch {
            // TODO: Handle error
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
}
