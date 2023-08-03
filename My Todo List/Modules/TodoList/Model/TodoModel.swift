//
//  TodoModel.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 03/08/23.
//

import Foundation

// This model is to help differentiate between object entity and data model
struct TodoModel {
    let title: String
    let desc: String?
    let date: Date
}
