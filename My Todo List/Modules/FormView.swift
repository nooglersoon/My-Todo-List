//
//  FormView.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import SwiftUI

struct FormView: View {
    
    // Call the viewModel environment object
    
    let viewModel: TodoViewModel
    
    init(viewModel: TodoViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var date: Date = Date()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                DatePicker("Pick a Date", selection: $date,displayedComponents: .date)
            } header: {
                Text("To Do")
            }
            Section {
                Button(action: {
                    viewModel.addItem(todo: .init(title: title, desc: description, date: date))
                    dismiss()
                }) {
                    Text("Submit")
                }
                .disabled(title.isEmpty)
            }
        }
    }
}

//struct FormView_Previews: PreviewProvider {
//    static var previews: some View {
//        FormView()
//    }
//}
