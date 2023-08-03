//
//  ContentView.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import SwiftUI

struct ContentView: View {
    
    // Call the viewModel environment object
    let viewModel: TodoViewModel
    
    init(viewModel: TodoViewModel) {
        self.viewModel = viewModel
    }
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Todo.dueDate,ascending: true)],
        animation: .default
    )
    private var items: FetchedResults<Todo>
    
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            List {
                if items.count > 0 {
                    // Get the todo items from the persistence store through viewModel
                    ForEach(items) { todo in
                        NavigationLink {
                            FormView(viewModel: viewModel, todo: todo)
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
            .sheet(isPresented: $showingAlert, content: {
                FormView(viewModel: viewModel)
            })
            .navigationTitle("My To Do")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showingAlert.toggle()
                    }) {
                        Text("Add")
                    }
                }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
