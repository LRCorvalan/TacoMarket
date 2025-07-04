//
//  Item.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import SwiftUI

struct Item: Identifiable {
    var type: ItemType
    var count: Int
    var id = UUID()
    
    init(type: ItemType) {
        self.type = type
        self.count = type.startCount
    }
    
    var priceView: String {
        String(format: "%.2f", type.price)
    }
}

var banana = Item(type: .banana)
var allItems: [Item] = ItemType.allCases.map { Item(type: $0) }
