//
//  CatalogView.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//

import SwiftUI
import SwiftData

struct CatalogView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var cart: CartManager
    @State private var searchText = ""
    @State private var sortOption: SortOption = .priceAsc
    
    enum SortOption: String, CaseIterable, Identifiable {
        case priceAsc = "Price ↑"
        case priceDesc = "Price ↓"
        case availability = "Availability"
        var id: String { rawValue }
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search...", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                Menu {
                    Picker("Sort", selection: $sortOption) {
                        ForEach(SortOption.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                } label: {
                    Label("Sort", systemImage: "arrow.up.arrow.down.circle")
                }
            }
            .padding()
            
            List(filteredItems) { item in
                ItemRow(item: item)
                    .environmentObject(cart)
            }
        }
        .onAppear(perform: seedItemsIfNeeded)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: CartView()) {
                    Image(systemName: "cart")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: OrderHistoryView()) {
                    Image(systemName: "clock")
                }
            }
        }
    }
    
    var filteredItems: [Item] {
        var items = (try? context.fetch(FetchDescriptor<Item>())) ?? []
        if !searchText.isEmpty {
            items = items.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.details.localizedCaseInsensitiveContains(searchText)
            }
        }
        switch sortOption {
        case .priceAsc:    items.sort { $0.price < $1.price }
        case .priceDesc:   items.sort { $0.price > $1.price }
        case .availability:items.sort { $0.isAvailable && !$1.isAvailable }
        }
        return items
    }
    
    func seedItemsIfNeeded() {
        let existing = (try? context.fetch(FetchDescriptor<Item>())) ?? []
        if existing.isEmpty {
            for item in allItems {
                context.insert(item)
            }
            try? context.save()
        }
    }
}
