//
//  ListRowView.swift
//  Priority
//
//  Created by Osama Fahim on 1/2/25.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
    }
}

#Preview {
    
    let firstItem = ItemModel(title: "First Item", isCompleted: true)
    let secondItem = ItemModel(title: "Second Item", isCompleted: false)
    
    return Group {
        ListRowView(item: firstItem)
        ListRowView(item: secondItem)
    }
    .previewLayout(.sizeThatFits)
}
