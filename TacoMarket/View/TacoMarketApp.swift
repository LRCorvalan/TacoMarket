//
//  TacoMarketApp.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import SwiftUI

@main
struct TacoMarketApp: App {
    @State private var allItems: [Item] = ItemType.allCases.map { Item(type: $0) }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
