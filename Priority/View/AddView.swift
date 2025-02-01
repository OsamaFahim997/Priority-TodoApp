//
//  AddView.swift
//  Priority
//
//  Created by Osama Fahim on 1/2/25.
//

import SwiftUI

struct AddView: View {
    
    @State var textfieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type anything", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("SAVE")
                })
                .padding()
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 50)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Add an item 🖊️")
    }
}

#Preview {
    NavigationView(content: {
        AddView()
    })
}
