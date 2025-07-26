//
//  CartManager.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//

import Foundation

class CartManager: ObservableObject {
    @Published var items: [CartItem] = []
    let taxRate = 0.0825

    var subtotal: Double { items.reduce(0) { $0 + $1.item.price * Double($1.quantity) } }
    var tax: Double { subtotal * taxRate }
    var total: Double { subtotal + tax }

    func add(_ item: Item) {
        if let idx = items.firstIndex(where: { $0.item.id == item.id }) {
            items[idx].quantity += 1
        } else {
            items.append(CartItem(item: item))
        }
    }

    func remove(_ cartItem: CartItem) {
        items.removeAll { $0.id == cartItem.id }
    }

    func clear() {
        items.removeAll()
    }
}
