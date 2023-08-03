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
    
    var viewModel: TodoViewModel!
    
    override func setUpWithError() throws {
        viewModel = TodoViewModel(viewContext: mockPersistentContainer.viewContext)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func test_fetch_item_with_empty_result() throws {
        let todos = fetch()
        XCTAssertEqual(todos?.count, 0)
    }
    
    func test_add_item() throws {
        
        viewModel.addItem(.init(title: "Test 1", desc: nil, date: .now))
        viewModel.addItem(.init(title: "Test 2", desc: nil, date: .now))
        viewModel.addItem(.init(title: "Test 3", desc: nil, date: .now))
        
        let todos = fetch()
        
        XCTAssertEqual(todos?.count, 3)
        
    }
    
}

private extension My_Todo_ListTests {
    
    // Mock Persistent Container
    var mockPersistentContainer: NSPersistentContainer {
        
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
