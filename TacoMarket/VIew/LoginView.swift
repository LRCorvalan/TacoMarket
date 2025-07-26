//
//  LoginView.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var auth: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Login").font(.largeTitle)
            TextField("Email", text: $email)
                .textContentType(.emailAddress)
                .autocapitalization(.none)
                .padding().background(Color(.secondarySystemFill)).cornerRadius(8)
            SecureField("Password", text: $password)
                .padding().background(Color(.secondarySystemFill)).cornerRadius(8)
            Button("Login") {
                auth.login(email: email, password: password)
            }
            .buttonStyle(.borderedProminent)
            
            if let err = auth.errorMessage {
                Text(err)
                    .foregroundStyle(.red)
                    .font(.caption)
            }
            
            Spacer()
            NavigationLink("Don't have an account? Register", destination: RegisterView())
        }
        .padding()
        .onAppear {
            auth.errorMessage = nil
        }
    }
}
