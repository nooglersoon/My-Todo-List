//
//  ContentView.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var title = ""
    @State private var description = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Develop iOS Apps")
                            .font(.title3)
                        Spacer()
                        Text("10/11")
                            .font(.footnote)
                    }
                    Text("Using SwiftUI")
                        .font(.callout)
                        .lineLimit(2)
                }
                .alert("Create new todo", isPresented: $showingAlert) {
                    VStack(spacing: 16) {
                        TextField("Enter title", text: $title)
                        TextField("Enter description", text: $description)
                    }
                    Button(action: {}) {
                        Text("Add")
                    }
                } message: {
                    Text("Please enter title and description")
                }
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
