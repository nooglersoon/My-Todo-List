//
//  String+Ext.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import Foundation

extension Date {
    
    var toShortFormattedString: String {
        let itemFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter
        }()
        
        return itemFormatter.string(from: self)
    }
    
}
