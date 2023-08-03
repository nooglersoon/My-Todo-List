//
//  TodoCellView.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 03/08/23.
//

import SwiftUI

struct TodoCellView: View {
    
    let title: String
    let dueDate: Date?
    let desc: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.title3)
                Spacer()
                Text(dueDate?.toShortFormattedString ?? "")
                    .font(.footnote)
            }
            Text(desc ?? "")
                .font(.callout)
                .lineLimit(2)
        }
    }
}
