//
//  ChosenDishModel.swift
//  testTask
//
//  Created by N S on 01.07.2023.
//

import Foundation

final class Order: ObservableObject {
    @Published var items = [Item]()
    
    var totalPrice: Int {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ treat: Item) {
        items.append(treat)
        print("ADDED")
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
