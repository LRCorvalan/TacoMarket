//
//  BackgroundColor.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/30/25.
//

import SwiftUI

struct BackgroundColor: View {
    var body: some View {
        LinearGradient(colors: [.black, .green], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            .opacity(0.4)
    }
}

#Preview {
    BackgroundColor()
}
