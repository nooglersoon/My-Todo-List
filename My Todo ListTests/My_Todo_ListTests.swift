//
//  My_Todo_ListTests.swift
//  My Todo ListTests
//
//  Created by Fauzi Achmad B D on 03/08/23.
//

import XCTest
import CoreData
@testable import My_Todo_List

@MainActor
final class My_Todo_ListTests: XCTestCase {
    
    // Mock Persistent Container
    lazy var mockPersistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "TodoModel")
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false // Make it simpler in test env
        
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (description, error) in
            // Check if the data store is in memory
            precondition( description.type == NSInMemoryStoreType )
            
            // Check if creating container wrong
            if let error = error {
                fatalError("Create an in-mem coordinator failed \(error)")
            }
        }
        return container
    }()
    
    var viewModel: TodoViewModel!
    
    override func setUpWithError() throws {
        viewModel = TodoViewModel(viewContext: mockPersistentContainer.viewContext)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testExample() throws {
        
        viewModel.addItem(.init(title: "Test", desc: nil, date: .now))
        
        let todos = fetch()
        
        XCTAssertEqual(todos?.count, 1)
        
    }
    
    
    // Helper to fetch mock data
    
    func fetch() -> [Todo]? {
        do {
            let todos = try viewModel.viewContext.fetch(Todo.fetchRequest())
            return todos
        } catch {
            return nil
        }
    }
    
}