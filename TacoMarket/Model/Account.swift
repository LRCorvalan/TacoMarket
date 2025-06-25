//
//  Account.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import Foundation

struct Account {
    var email: String
    var password: String
    var address: String
    var orders: [Order] = []
}
