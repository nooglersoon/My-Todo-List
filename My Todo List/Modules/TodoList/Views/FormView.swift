//
//  FormView.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import SwiftUI

struct FormView: View {
    
    // Call the viewModel environment object
    @EnvironmentObject var viewModel: TodoViewModel
    
    let todo: Todo?
    
    init(todo: Todo? = nil) {
        self.todo = todo
    }
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var date: Date = Date()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ContainerView {
            VStack {
                HStack {
                    Text(todo == nil ? "Add Todo" : "Edit Todo")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 24)
                Form {
                    Section {
                        TextField("Title", text: $title)
                        TextField("Description", text: $description)
                        DatePicker("Due date", selection: $date, in: Date()..., displayedComponents: .date)
                    } header: {
                        Text("To Do")
                    }
                }
                Button(action: {
                    handleButtonAction()
                    dismiss()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                        Text(todo == nil ? "Add Todo" : "Update")
                            .foregroundColor(.white)
                    }
                    .frame(height: 40)
                    .padding()
                }
                .disabled(title.isEmpty)
            }
            .onAppear {
                if let todo {
                    title = todo.title ?? ""
                    description = todo.desc ?? ""
                    date = todo.dueDate ?? Date()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func handleButtonAction() {
        if let todo {
            viewModel.updateItem(
                todo: todo,
                with: .init(
                    title: title,
                    desc: description,
                    date: date)
            )
        } else {
            viewModel.addItem(
                .init(
                    title: title,
                    desc: description,
                    date: date)
            )
        }
    }
    
}
