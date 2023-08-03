//
//  TodoViewModel.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import Foundation
import SwiftUI
import CoreData

enum ErrorType: LocalizedError {
    case failedToSaveData(String)
}

@MainActor
class TodoViewModel: ObservableObject {
    
    private(set) var viewContext: NSManagedObjectContext
    
    @Published var showAlert: Bool = false
    @Published var errorType: ErrorType?
    
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
            errorType = .failedToSaveData("Sorry failed to save the data. Try again later")
            showAlert.toggle()
        }
    }
    
}
