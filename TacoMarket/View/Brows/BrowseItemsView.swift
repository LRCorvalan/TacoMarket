//
//  BrowseItemsView.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import SwiftUI

struct BrowseItemsView: View {
    private var itemTypes = ItemType.allCases
    @State private var searchText = ""
    
    var body: some View {
        List {
            ForEach(serachResults, id: \.self) { itemType in
                ItemIndex(item: Item(type: itemType))
            }
        }
        .searchable(text: $searchText)
    }
    
    var serachResults: [ItemType] {
        if searchText.isEmpty {
            return ItemType.allCases
        } else {
            var foundItems: [ItemType] = []
            foundItems += itemTypes.filter { $0.rawValue.capitalized.contains(searchText) }
            foundItems += itemTypes.filter { $0.description.contains(searchText) }
            return foundItems
        }
    }
}

#Preview {
    NavigationStack {
        BrowseItemsView()
    }
}
