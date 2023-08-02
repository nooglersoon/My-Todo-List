//
//  My_Todo_ListApp.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import SwiftUI

@main
struct My_Todo_ListApp: App {
    
    let persistenceManager = PersistenceManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceManager.container.viewContext)
        }
    }
}
