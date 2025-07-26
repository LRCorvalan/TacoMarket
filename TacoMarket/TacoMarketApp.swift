//
//  TacoMarketApp.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import SwiftUI
import SwiftData

@main
struct TacoMarketApp: App {
    // 1️⃣ Build the container yourself
    private let container: ModelContainer
    
    // 2️⃣ Initialize your view‐models with the container's mainContext
    @StateObject private var authVM: AuthViewModel
    @StateObject private var cartMgr = CartManager()
    
    init() {
        self.container = try! ModelContainer(
            for: User.self, Item.self, CartItem.self, Order.self
        )
        let ctx = container.mainContext
        _authVM = StateObject(wrappedValue: AuthViewModel(context: ctx))
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
            // 3️⃣ Inject the *same* instances everywhere
                .environmentObject(authVM)
                .environmentObject(cartMgr)
        }
        // 4️⃣ Install *your* container on the scene
        .modelContainer(container)
    }
}
