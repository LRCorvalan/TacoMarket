//
//  SignUpView.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import SwiftUI

struct SignUpView: View {
    @State var account: Account
    
    var body: some View {
        ZStack {
            Color.red
                .opacity(0.4)
                .ignoresSafeArea()
            
            VStack {
                TextField("Email", text: $account.email)
                SecureField("Password", text: $account.password)
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .padding()
                        .foregroundStyle(.white)
                        .font(.title2)
                        .padding(.horizontal)
                        .bold()
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.blue)
                        }
                }
                .padding(.bottom)
            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
    }
}

#Preview {
    SignUpView(account: Account(email: "", password: "", address: ""))
}
