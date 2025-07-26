//
//  RegisterView.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var auth: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var address = ""

    var body: some View {
        VStack(spacing: 16) {
            Text("Register").font(.largeTitle)
            TextField("Email", text: $email)
                .textContentType(.emailAddress)
                .autocapitalization(.none)
                .padding().background(Color(.secondarySystemFill)).cornerRadius(8)
            SecureField("Password", text: $password)
                .padding().background(Color(.secondarySystemFill)).cornerRadius(8)
            TextField("Address", text: $address)
                .padding().background(Color(.secondarySystemFill)).cornerRadius(8)
            Button("Create Account") {
                auth.register(email: email, password: password, address: address)
            }
            .buttonStyle(.borderedProminent)
            
            if let err = auth.errorMessage {
                Text(err)
                    .foregroundStyle(.red)
                    .font(.caption)
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            auth.errorMessage = nil
        }
    }
}
