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
                    CatalogView()
                        .environmentObject(cart)
                } else {
                    LoginView()
                }
            }
            .navigationTitle("Taco Market - \(auth.currentUser?.email ?? "")")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Logout") {
                        auth.logout()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        UserListView()
                    } label: {
                        Image(systemName: "person.3.fill")
                    }
                }
            }
        }
    }
}
