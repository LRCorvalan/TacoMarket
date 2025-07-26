//
//  TacoMarketApp.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import SwiftUI

@main
struct TacoMarketApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView(allItems: $allItems)
            Circle()
        }
        .modelContainer(for: [Account.self, Order.self, Item.self])
    }
}
