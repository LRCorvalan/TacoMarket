//
//  Order.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//

import Foundation
import SwiftData

@Model
class Order: Identifiable {
    @Attribute(.unique) var id: UUID
    @Relationship(deleteRule: .cascade) var items: [CartItem]
    var date: Date
    var deliveryType: String
    var discountCode: String?

    init(items: [CartItem], deliveryType: String, discountCode: String? = nil) {
        self.id = UUID()
        self.items = items
        self.date = Date()
        self.deliveryType = deliveryType
        self.discountCode = discountCode
    }
}
