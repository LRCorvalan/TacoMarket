//
//  Item.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//  TestItem added - Mark F. 

import Foundation
import SwiftData

@Model
class Item: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var details: String
    var price: Double
    var isAvailable: Bool
    
    var imageName: String {
        name
    }

    init(name: String, details: String, price: Double, isAvailable: Bool = true) {
        self.id = UUID()
        self.name = name
        self.details = details
        self.price = price
        self.isAvailable = isAvailable
    }
}
// test Item
//Item(name: "TestName", details: "TestItem", "1.00"),
let allItems = [
    Item(name: "Avocado", details: "Fruit", price: 1.50),
    Item(name: "Bacon", details: "Meat", price: 4.99),
    Item(name: "Banana", details: "Fruit", price: 0.59),
    Item(name: "Bread", details: "Grain", price: 2.49),
    Item(name: "Cheese", details: "Dairy", price: 3.99, isAvailable: false),
    Item(name: "Chicken", details: "Meat", price: 5.99),
    Item(name: "Cilantro", details: "Vegetables", price: 0.99),
    Item(name: "Coffee", details: "Drink", price: 7.99),
    Item(name: "Eggs", details: "Dairy", price: 2.99),
    Item(name: "Jalapeno", details: "Vegetables", price: 1.29),
    Item(name: "Lettuce", details: "Vegetavles", price: 1.49),
    Item(name: "Lime", details: "Fruit", price: 0.79),
    Item(name: "Milk", details: "Dairy", price: 3.49),
    Item(name: "Olive Oil", details: "Cook", price: 8.99),
    Item(name: "Onion", details: "Vegetavles", price: 0.89),
    Item(name: "Pepper", details: "Vegetables", price: 5.49, isAvailable: false),
    Item(name: "Salt", details: "Cook", price: 1.19),
    Item(name: "Taco", details: "Mexico", price: 2.99),
    Item(name: "Toilet Paper", details: "Bathroom", price: 6.99),
    Item(name: "Tomatoes", details: "Fruit", price: 2.79),
    Item(name: "Tortillas", details: "Mexico", price: 3.29),
]
