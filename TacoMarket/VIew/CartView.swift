//
//  CartView.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartManager
    
    var body: some View {
        VStack {
            if cart.items.isEmpty {
                Text("Your cart is empty")
                    .font(.title2)
                    .foregroundColor(.secondary)
                Spacer()
            } else {
                List {
                    ForEach(cart.items) { cartItem in
                        HStack {
                            Image(cartItem.item.imageName)
                                .resizable()
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading) {
                                Text(cartItem.item.name)
                                Text("\(cartItem.quantity) x $\(cartItem.item.price, specifier: "%.2f")")
                                    .font(.subheadline)
                                Text("Total: $\(Double(cartItem.quantity) * cartItem.item.price, specifier: "%.2f")")
                                    .font(.subheadline)
                            }
                            Spacer()
                            Button(action: { cart.remove(cartItem) }) {
                                Image(systemName: "trash")
                            }
                        }
                    }
                }
                VStack(spacing: 8) {
                    HStack {
                        Text("Subtotal:")
                        Spacer()
                        Text("$\(cart.subtotal, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Tax:")
                        Spacer()
                        Text("$\(cart.tax, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Total:")
                        Spacer()
                        Text("$\(cart.total, specifier: "%.2f")")
                    }
                    NavigationLink("Checkout", destination: CheckoutView())
                        .buttonStyle(.borderedProminent)
                }
                .padding()
            }
        }
        .navigationTitle("Cart")
    }
}

