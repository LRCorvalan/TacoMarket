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
            LinearGradient(colors: [.white, .yellow], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .opacity(0.6)
            
            VStack(spacing: 20) {
                Text("Taco Market")
                    .font(.largeTitle)
                    .bold()
                
                Text("🌮")
                    .font(.system(size: 80))
                    .padding(.bottom, 24)
                
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
                        // MARK: - Create account
                    } else {
                        print("Logging in…")
                        // MARK: - login
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
        }
    }
}

#Preview {
    LoginSignupView(account: .constant(Account(email: "", password: "", address: "")))
}
