//
//  UserDetailView.swift
//  CallAPI
//
//  Created by Siddharth on 30/05/26.
//

import SwiftUI

struct UserDetailView: View {

    let user: User

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(user.name)
                .font(.largeTitle)
                .bold()

            Text("Email: \(user.email)")
            Text("Phone: \(user.phone)")

            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
}
