//
//  ItemView.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/28/25.
//

import SwiftUI

struct ItemView: View {
    @Binding var item: Item
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack {
                Text(item.type.name)
                Text("-")
                Text("$" + item.priceView)
            }
            .font(.title)
            .bold()
            
            Image(item.type.rawValue)
                .resizable()
                .scaledToFit()
                .frame(height: 354)
                .padding(.horizontal)
            
            Button {
                
            } label: {
                Capsule()
                    .frame(height: 54)
                    .foregroundStyle(.red)
                    .overlay {
                        Text("Add to cart")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ItemView(item: .constant(banana))
}
