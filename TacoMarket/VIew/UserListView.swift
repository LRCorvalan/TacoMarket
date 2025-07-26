//
//  UserListView.swift
//  TacoMarketTest
//
//  Created by Luis Corvalan on 7/26/25.
//

import SwiftUI
import SwiftData

struct UserListView: View {
    @Query(FetchDescriptor<User>()) private var users: [User]
    
    var body: some View {
        List(users) { user in
            VStack(alignment: .leading) {
                Text("Email: \(user.email)")
                Text("Password: \(user.password)")
                Text("Address: \(user.address)")
            }
        }
        .navigationTitle("All Users")
    }
}
