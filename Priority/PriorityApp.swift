//
//  PriorityApp.swift
//  Priority
//
//  Created by Osama Fahim on 1/2/25.
//

import SwiftUI

@main
struct PriorityApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
