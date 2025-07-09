//
//  Account.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import Foundation
import SwiftData

@Model
class Account {
    var email: String
    var password: String
    var address: String
    @Relationship(deleteRule: .cascade)
    var orders: [Order]
    
    init(email: String, password: String, address: String) {
        self.email = email
        self.password = password
        self.address = address
        self.orders = []
    }
}
