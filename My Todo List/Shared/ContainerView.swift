//
//  WrapperView.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 03/08/23.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    
    // Call the viewModel environment object
    @EnvironmentObject var viewModel: TodoViewModel
    
    @ViewBuilder var content: Content
    var body: some View {
        content
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
