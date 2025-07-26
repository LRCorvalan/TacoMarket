//
//  AuthViewModel.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//

import Foundation
import SwiftData

class AuthViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var errorMessage: String?
    private let context: ModelContext
    private let userDefaultsKey = "loggedInUserID"
    
    init(context: ModelContext) {
        self.context = context
        
        if let idString = UserDefaults.standard.string(forKey: userDefaultsKey),
           let uuid = UUID(uuidString: idString) {
            let req = FetchDescriptor<User>(predicate: #Predicate<User> { $0.id == uuid })
            if let saved = try? context.fetch(req).first {
                currentUser = saved
            }
        }
    }
    
    var isLoggedIn: Bool { currentUser != nil }
    
    func register(email: String, password: String, address: String) {
        errorMessage = nil                         // clear old errors
        
        // 1️⃣ Check for existing account
        let existsReq = FetchDescriptor<User>(
            predicate: #Predicate<User> { $0.email == email }
        )
        if let found = try? context.fetch(existsReq), !found.isEmpty {
            errorMessage = "An account with that email already exists."
            return
        }
        
        // 2️⃣ Proceed with registration
        let user = User(email: email, password: password, address: address)
        context.insert(user)
        try? context.save()
        currentUser = user
        UserDefaults.standard.set(currentUser!.id.uuidString, forKey: userDefaultsKey)
    }
    
    func login(email: String, password: String) {
        errorMessage = nil                         // clear old errors
        
        let req = FetchDescriptor<User>(
            predicate: #Predicate<User> { $0.email == email && $0.password == password }
        )
        if let u = try? context.fetch(req).first {
            currentUser = u
            UserDefaults.standard.set(currentUser!.id.uuidString, forKey: userDefaultsKey)
        } else {
            errorMessage = "Invalid email or password."
        }
    }
    
    func logout() {
        currentUser = nil
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
        let all = (try? context.fetch(FetchDescriptor<User>())) ?? []
        errorMessage = nil
        print("🔍 All users:", all.map(\.email))
    }
}
