//
//  BrowseItemsView.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import SwiftUI

struct BrowseItemsView: View {
    @Binding var allItems: [Item]
    @State private var searchText = ""
    @State private var isPriceSearch = true
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults) { item in
                    if let index = allItems.firstIndex(where: { $0.id == item.id }) {
                        ItemIndex(item: $allItems[index])
                    }
                }
            }
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker("", selection: $isPriceSearch) {
                        Text("Price")
                            .tag(true)
                        Text("Availability")
                            .tag(false)
                    }
                    .padding(.horizontal)
                    .pickerStyle(.palette)
                }
            }
        }
    }
    
    private var searchResults: [Item] {
        let sortedItems: [Item] = {
            switch isPriceSearch {
            case true:
                return allItems.sorted { $0.priceView < $1.priceView }
            default:
                return allItems.sorted { $0.count > $1.count }
            }
        }()
        
        if searchText.isEmpty {
            return sortedItems
        } else {
            return sortedItems.filter {
                $0.type.name.localizedCaseInsensitiveContains(searchText) ||
                $0.type.description.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

#Preview {
    BrowseItemsView(allItems: .constant(allItems))
}
