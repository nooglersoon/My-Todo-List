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
            TodoListView()
            .sheet(isPresented: $showingAlert, content: {
                FormView()
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
