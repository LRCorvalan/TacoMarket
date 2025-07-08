//
//  ContentView.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import SwiftUI

struct ContentView: View {
    @Binding var allItems: [Item]
    
    var body: some View {
        TabView {
            BrowseItemsView(allItems: $allItems)
                .tabItem {
                    Image(systemName: "storefront.fill")
                    Text("Browse")
                }
            
            Circle()
                .tabItem {
                    Image(systemName: "wallet.bifold.fill")
                    Text("Pay")
                }
            
            Circle()
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
                }
        }
    }
}

#Preview {
    ContentView(allItems: .constant(allItems))
}
