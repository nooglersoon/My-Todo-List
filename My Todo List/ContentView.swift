//
//  ContentView.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import SwiftUI

struct ContentView: View {
    
    // Call the viewModel environment object
    @EnvironmentObject var viewModel: TodoViewModel
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            List {
                // Get the todo items from the persistence store through viewModel
                ForEach(viewModel.items) { todo in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(todo.title ?? "")
                                .font(.title3)
                            Spacer()
                            Text("10/11")
                                .font(.footnote)
                        }
                        Text(todo.desc ?? "")
                            .font(.callout)
                            .lineLimit(2)
                    }
                }
                .onDelete { indexSet in
                    viewModel.deleteItems(offsets: indexSet)
                }
            }
            // Alert to create new todo
            .alert("Create new todo", isPresented: $showingAlert) {
                VStack(spacing: 16) {
                    TextField("Enter title", text: $viewModel.title)
                    TextField("Enter description", text: $viewModel.desc)
                }
                Button(action: {
                    viewModel.addItem()
                }) {
                    Text("Add")
                }
            } message: {
                Text("Please enter title and description")
            }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
