//
//  Order.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import Foundation

struct Order {
    var discountCode: String
    var isDiscountOn = false
    var items: [Item] = []
    var delivery: Delivery
    var date: Date
    
    var totalPrice: Double {
        var totalPrice: Double = 0
        for item in items {
            totalPrice += item.price
        }
        
        if isDiscountOn {
            totalPrice *= 0.9
        }
        
        totalPrice *= 1.0825
        
        return totalPrice
    }
}
