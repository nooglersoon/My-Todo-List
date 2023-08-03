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
    
    @State private var bottomSheetOpened = false
    
    var body: some View {
        NavigationView {
            TodoListView()
            .sheet(isPresented: $bottomSheetOpened, content: {
                FormView()
            })
            .navigationTitle("My To Do")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        bottomSheetOpened.toggle()
                    }) {
                        Text("Add")
                    }
                }
            }
            .alert("Ouch something happened.", isPresented: $viewModel.showAlert) {
                Button("OK") {}
            } message: {
                switch viewModel.errorType {
                case let .failedToSaveData(desc):
                    Text(desc)
                default:
                    Text("Unknown error")
                }
            }
        }
    }
}
