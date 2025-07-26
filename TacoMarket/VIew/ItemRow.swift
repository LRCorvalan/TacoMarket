//
//  ItemRow.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//

import SwiftUI

struct ItemRow: View {
    var item: Item
    @EnvironmentObject var cart: CartManager
    
    var body: some View {
        HStack {
            Image(item.imageName)
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(item.name).font(.headline)
                Text(item.details).font(.subheadline)
                Text("$\(item.price, specifier: "%.2f")").font(.subheadline)
            }
            Spacer()
            if item.isAvailable {
                Button(action: { cart.add(item) }) {
                    Image(systemName: "plus.circle.fill")
                }
                Text("×\(cart.items.first(where: { $0.item.id == item.id })?.quantity ?? 0)")
                    .font(.caption2)
                    .padding(.horizontal, 6)
                    .background(Color(.secondarySystemFill))
                    .cornerRadius(6)
            } else {
                Text("Out").foregroundColor(.red)
            }
        }
        .padding(.vertical, 4)
    }
}
