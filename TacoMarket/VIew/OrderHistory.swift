//
//  OrderHistory.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//

import SwiftUI
import SwiftData

struct OrderHistoryView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var cart: CartManager
    @State private var sortOption: SortOption = .date

    enum SortOption: String, CaseIterable, Identifiable {
        case date = "Date"
        case amount = "Amount"
        var id: String { rawValue }
    }

    @Query(FetchDescriptor<Order>()) private var orders: [Order]

    var body: some View {
        VStack {
            Picker("Sort by", selection: $sortOption) {
                ForEach(SortOption.allCases) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            .pickerStyle(.segmented)
            .padding()

            List(sortedOrders) { order in
                VStack(alignment: .leading) {
                    Text(order.date, formatter: dateFormatter).font(.headline)
                    Text("Total: $\(orderTotal(order), specifier: "%.2f")")
                        .font(.subheadline)
                }
            }
        }
        .navigationTitle("Order History")
    }

    private var sortedOrders: [Order] {
        switch sortOption {
        case .date:
            return orders.sorted { $0.date > $1.date }
        case .amount:
            return orders.sorted { orderTotal($0) > orderTotal($1) }
        }
    }

    private func orderTotal(_ order: Order) -> Double {
        let subtotal = order.items.reduce(0) {
            $0 + $1.item.price * Double($1.quantity)
        }
        return subtotal + subtotal * cart.taxRate
    }

    private var dateFormatter: DateFormatter {
        let fmt = DateFormatter()
        fmt.dateStyle = .medium
        fmt.timeStyle = .short
        return fmt
    }
}
