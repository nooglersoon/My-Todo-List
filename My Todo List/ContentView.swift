//
//  ContentView.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var bottomSheetOpened = false
    
    var body: some View {
        ContainerView {
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
            }
        }
    }
}
