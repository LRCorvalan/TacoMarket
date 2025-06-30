//
//  LoginSignupView.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import SwiftUI

struct LoginSignupView: View {
    @Binding var account: Account
    @State private var isSigningUp = false
    
    var body: some View {
        ZStack {
            BackgroundColor()
            
            VStack(spacing: 20) {
                Text("Taco Market")
                    .font(.largeTitle)
                    .bold()
                
                Text("🌮")
                    .font(.system(size: 80))
                
                Picker("", selection: $isSigningUp) {
                    Text("Log In").tag(false)
                    Text("Sign Up").tag(true)
                }
                .pickerStyle(.segmented)
                .padding(.bottom)
                
                
                TextField("Email", text: $account.email)
                SecureField("Password", text: $account.password)
                
                if isSigningUp {
                    TextField("Address", text: $account.address)
                }
                
                Button {
                    if isSigningUp {
                        print("Signing up…")
                    } else {
                        print("Logging in…")
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.red)
                        .opacity(0.8)
                        .frame(height: 70)
                        .overlay {
                            Image(systemName: "arrow.right")
                                .foregroundStyle(.white)
                        }
                }
                .padding(.vertical)
                .font(.title2)
                .bold()
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            .onChange(of: isSigningUp, { oldValue, newValue in
                withAnimation(.easeInOut) { }
            })
        }
    }
}

#Preview {
    LoginSignupView(account: .constant(Account(email: "", password: "", address: "")))
}
