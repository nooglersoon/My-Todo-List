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
    
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            TodoListView(viewModel: viewModel)
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
