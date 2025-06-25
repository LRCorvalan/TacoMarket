//
//  BrowesItemsView.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import SwiftUI

struct BrowesItemsView: View {
    var items = ItemType.allCases
    
    var body: some View {
        VStack {
            ForEach(items, id: \.self) { item in
                HStack {
                    Image(item.rawValue)
                        .resizable()
                        .scaledToFit()
                    Text(item.rawValue)
                }
            }
        }
    }
}

#Preview {
    BrowesItemsView()
}
