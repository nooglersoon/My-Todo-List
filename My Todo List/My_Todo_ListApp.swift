//
//  My_Todo_ListApp.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import SwiftUI

@main
struct My_Todo_ListApp: App {
    
    // ViewModel Initialization
    @StateObject var viewModel = TodoViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
