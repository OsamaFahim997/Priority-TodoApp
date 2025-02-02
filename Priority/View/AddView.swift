//
//  AddView.swift
//  Priority
//
//  Created by Osama Fahim on 1/2/25.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var isPresented
    @EnvironmentObject var viewModel: ListViewModel
    @State var textfieldText: String = ""
    @State var showAlert: Bool = false
    var alertMessage = "Your todo item should be 3 characters long"
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type anything", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Button(action: {
                    saveButtonPressed()
                }, label: {
                    Text("SAVE")
                        .padding()
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                .contentShape(Rectangle())
            }
            .padding()
        }
        .navigationTitle("Add an item 🖊️")
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
    func saveButtonPressed() {
        if textfieldText.count >= 3 {
            viewModel.addItem(title: textfieldText)
            isPresented.callAsFunction()
        } else {
            showAlert.toggle()
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertMessage))
    }
}

#Preview {
    NavigationView(content: {
        AddView()
    })
}
