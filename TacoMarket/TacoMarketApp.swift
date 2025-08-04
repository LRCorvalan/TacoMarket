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
    private let container: ModelContainer
    
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
                .environmentObject(authVM)
                .environmentObject(cartMgr)
        }
        .modelContainer(container)
    }
}
