//
//  LoginView.swift
//  TacoMarket
//
//  Created by Luis Corvalan on 6/24/25.
//

import SwiftUI

struct LoginView: View {
    @Binding var account: Account
    
    var body: some View {
        ZStack {
            Color.red
                .opacity(0.4)
                .ignoresSafeArea()
            
            VStack {
                Text("Taco Market")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                
                Text("🌮")
                    .font(.system(size: 80))
                
                Spacer()
                
                TextField("Email", text: $account.email)
                SecureField("Password", text: $account.password)
                Button {
                    
                } label: {
                    Text("Login")
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
                
                Spacer()
                
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

            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
    }
}

#Preview {
    LoginView(account: .constant(Account(email: "123@qq.com", password: "asdf", address: "Your house")))
}
