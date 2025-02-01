//
//  ItemModel.swift
//  Priority
//
//  Created by Osama Fahim on 1/2/25.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id : String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateIsCompleted() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
