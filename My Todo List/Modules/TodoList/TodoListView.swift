//
//  TodoListView.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 03/08/23.
//

import SwiftUI

struct TodoListView: View {
    
    // Call the viewModel environment object
    @EnvironmentObject var viewModel: TodoViewModel
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Todo.dueDate,ascending: true)],
        animation: .default
    )
    private var items: FetchedResults<Todo>
    
    var body: some View {
        List {
            if items.count > 0 {
                // Get the todo items from the persistence store through viewModel
                ForEach(items) { todo in
                    NavigationLink {
                        FormView(todo: todo)
                    } label: {
                        TodoCellView(
                            title: todo.title ?? "",
                            dueDate: todo.dueDate,
                            desc: todo.desc
                        )
                    }
                }
                .onDelete { indexSet in
                    viewModel.deleteItems(items: items, offsets: indexSet)
                }
            } else {
                // Empty States
                Text("No current todos")
            }
        }
    }
}
