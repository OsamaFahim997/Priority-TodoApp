//
//  ListViewModel.swift
//  Priority
//
//  Created by Osama Fahim on 1/2/25.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    var itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let updatedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        items = updatedItems
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
    
    private func saveItems() {
        let data = try? JSONEncoder().encode(items)
        UserDefaults.standard.setValue(data, forKey: itemsKey)
    }
    
    func validText(title: String) -> Bool {
        if title.count < 3 {
            return false
        }
        return true
    }
}
