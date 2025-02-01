//
//  ListRowView.swift
//  Priority
//
//  Created by Osama Fahim on 1/2/25.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
        }
    }
}

#Preview {
    ListRowView(title: "")
}
