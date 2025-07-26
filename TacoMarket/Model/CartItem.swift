//
//  CartItem.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//

import Foundation
import SwiftData

@Model
class CartItem: Identifiable {
    @Attribute(.unique) var id: UUID
    @Relationship(deleteRule: .cascade) var item: Item
    var quantity: Int

    init(item: Item, quantity: Int = 1) {
        self.id = UUID()
        self.item = item
        self.quantity = quantity
    }
}
