//
//  Order.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import Foundation
import SwiftData

@Model
class Order {
    @Relationship(inverse: \Account.orders)
    var account: Account
    
    @Relationship(deleteRule: .nullify)
    var items: [Item]
    
    var discountCode: String
    var tryDiscountCode: String
    var delivery: DeliveryType
    var date: Date
    
    init(account: Account, tryDiscountCode: String = "", delivery: DeliveryType, date: Date) {
        self.account = account
        self.discountCode = "LetsGoMexico!"
        self.tryDiscountCode = ""
        self.items = []
        self.delivery = delivery
        self.date = date
    }
    
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
