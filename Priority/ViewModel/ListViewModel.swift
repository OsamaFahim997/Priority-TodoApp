//
//  ListViewModel.swift
//  Priority
//
//  Created by Osama Fahim on 1/2/25.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let listOfItems: [ItemModel] = [
            ItemModel(title: "This is first item", isCompleted: true),
            ItemModel(title: "Buy groceries", isCompleted: true),
            ItemModel(title: "Buy apples", isCompleted: false)
        ]
        items.append(contentsOf: listOfItems)
    }
    
    func moveItem(offset: IndexSet, newOffset: Int) {
        items.move(fromOffsets: offset, toOffset: newOffset)
    }
    
    func deleteItem(index: IndexSet) {
        items.remove(atOffsets: index)
    }
    
    func addItem(title: String) {
        let item: ItemModel = ItemModel(title: title, isCompleted: false)
        items.append(item)
    }
    
    func updateItem(item: ItemModel) {
        if let itemToUpdate = items.firstIndex(where: { $0.id == item.id }) {
            items[itemToUpdate] = item.updateIsCompleted()
        }
    }
    
    func validText(title: String) -> Bool {
        if title.count < 3 {
            return false
        }
        return true
    }
}
