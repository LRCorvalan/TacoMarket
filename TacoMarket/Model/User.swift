//
//  User.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//

import Foundation
import SwiftData

@Model
class User: Identifiable {
    @Attribute(.unique) var id: UUID
    var email: String
    var password: String
    var address: String
    
    init(email: String, password: String, address: String) {
        self.id = UUID()
        self.email = email
        self.password = password
        self.address = address
    }
    
    init() {
        self.id = UUID()
        self.email = ""
        self.password = ""
        self.address = ""
    }
}
