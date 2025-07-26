//
//  MainView.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    // Pull them from the environment instead of recreating
    @EnvironmentObject private var auth: AuthViewModel
    @EnvironmentObject private var cart: CartManager
    
    var body: some View {
        NavigationView {
            Group {
                if auth.isLoggedIn {
                    CatalogView(auth: auth)
                        .environmentObject(cart)
                } else {
                    LoginView()
                }
            }
        }
    }
}
