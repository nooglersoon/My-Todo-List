//
//  ContentView.swift
//  My Todo List
//
//  Created by Fauzi Achmad B D on 02/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Develop iOS Apps")
                            .font(.title3)
                        Spacer()
                        Text("10/11")
                            .font(.footnote)
                    }
                    Text("Using SwiftUI")
                        .font(.callout)
                        .lineLimit(2)
                }
            }
            .navigationTitle("My To Do")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
