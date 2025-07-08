//
//  ItemIndex.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/28/25.
//

import SwiftUI

struct ItemIndex: View {
    @Binding var item: Item
    
    var body: some View {
        NavigationLink {
            ItemView(item: $item)
        } label: {
            HStack(spacing: 40) {
                Image(item.type.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading) {
                    Text(item.type.name)
                        .font(.title2)
                    Text("$\(item.priceView)")
                    Text("\(item.count) Available")
                }
                .bold()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ItemIndex(item: .constant(banana))
    }
}
