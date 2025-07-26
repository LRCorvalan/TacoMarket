//
//  CheckoutView.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//

import SwiftUI
import SwiftData

struct CheckoutView: View {
    @EnvironmentObject var cart: CartManager
    @Environment(\.modelContext) private var context
    @State private var discountCode = ""
    
    @State private var deliveryType = "Standard"
    private let validCode = "Mexico!"
    
    private let deliveryOptions = ["Standard", "One-Day", "Two-Day"]
    
    private let discountCodes: [String: Double] = [
        "TACO10": 0.10,
        "FIESTA20": 0.15,
        "MEXICO!": 0.20,
        "MEXICO_IS_THE_BEST": 1.0
    ]
    
    private var discountRate: Double {
      discountCodes[discountCode] ?? 0.0
    }
    private var discountedSubtotal: Double {
        cart.subtotal * (1 - discountRate)
    }
    private var discountedTax: Double {
        discountedSubtotal * cart.taxRate
    }
    private var finalTotal: Double {
        discountedSubtotal + discountedTax
    }
    
    var body: some View {
        Form {
            Section(header: Text("Order Summary")) {
                HStack {
                    Text("Subtotal")
                    Spacer()
                    Text(String(format: "$%.2f", cart.subtotal))
                }
                
                if discountRate > 0 {
                    HStack {
                        Text("Discount")
                        Spacer()
                        Text("-" + String(format: "$%.2f", cart.subtotal * discountRate))
                    }
                    HStack {
                        Text("New Subtotal")
                        Spacer()
                        Text(String(format: "$%.2f", discountedSubtotal))
                    }
                    
                }
                
                HStack {
                    Text("Tax")
                    Spacer()
                    Text(String(format: "$%.2f", discountRate > 0 ? discountedTax : cart.tax))
                }
                HStack {
                    Text("Total")
                    Spacer()
                    Text(String(format: "$%.2f", discountRate > 0 ? finalTotal : cart.total))
                }
            }
            
            Section(header: Text("Delivery")) {
                Picker("Delivery", selection: $deliveryType) {
                    ForEach(deliveryOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                .pickerStyle(.segmented)
            }
            Section(header: Text("Discount Code")) {
                TextField("Code", text: $discountCode)
                    .textFieldStyle(.roundedBorder)
            }
            Section {
                Button("Place Order") {
                    placeOrder()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle("Checkout")
    }
    
    func placeOrder() {
        for cartItem in cart.items {
            context.insert(cartItem)
        }
        let order = Order(items: cart.items, deliveryType: deliveryType, discountCode: discountCode.isEmpty ? nil : discountCode)
        context.insert(order)
        try? context.save()
        cart.clear()
    }
}
