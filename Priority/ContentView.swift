//
//  ContentView.swift
//  Priority
//
//  Created by Osama Fahim on 1/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var items: [String] = [
        "This is first item",
        "Buy groceries",
        "Buy apples"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .navigationTitle("To do list")
        .navigationBarItems(
            leading: EditButton(), 
            trailing: NavigationLink("Add", destination: {
                AddView()
            })
        )
    }
}

#Preview {
    NavigationView(content: {
        ContentView()
    })
}
