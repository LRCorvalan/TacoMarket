//
//  Order.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import Foundation

struct Order {
    let discountCode = "LetsGoMexico!"
    var tryDiscountCode = ""
    var items: [Item] = []
    var delivery: Delivery
    var date: Date
    
    var totalPrice: Double {
        var totalPrice = 0.0
        for item in items {
            totalPrice += item.type.price
        }
        
        if tryDiscountCode == discountCode {
            totalPrice *= 0.9
        }
        
        totalPrice *= 1.0825
        
        return totalPrice
    }
}
