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
    
    enum SearchType: String, CaseIterable {
        case price, availability
    }
    
    @State private var selectedSearchType: SearchType = .price
    
    var body: some View {
        List {
            ForEach(searchResults, id: \.self) { itemType in
                ItemIndex(item: Item(type: itemType))
            }
        }
        .searchable(text: $searchText)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Picker("asdf", selection: $selectedSearchType) {
                    ForEach(SearchType.allCases, id: \.self) {
                        Text($0.rawValue.capitalized)
                    }
                }
                .pickerStyle(.palette)
            }
        }
    }
    
    var searchResults: [ItemType] {
        let sortedItems: [ItemType] = {
            switch selectedSearchType {
            case .availability:
                return itemTypes.sorted { $0.startCount > $1.startCount }
            case .price:
                return itemTypes.sorted { $0.price < $1.price }
            }
        }()

        if searchText.isEmpty {
            return sortedItems
        } else {
            return sortedItems.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.description.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

#Preview {
    NavigationStack {
        BrowseItemsView()
    }
}
