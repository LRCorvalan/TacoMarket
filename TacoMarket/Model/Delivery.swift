//
//  Delivery.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import Foundation

struct Delivery {
    private var oneDayDelivery = false
    private var twoDayDelivery = false
    
    mutating func oneDayDeliveryOn() {
        oneDayDelivery = true
        twoDayDelivery = false
    }
    
    mutating func twoDayDeliveryOn() {
        oneDayDelivery = false
        twoDayDelivery = true
    }
}
