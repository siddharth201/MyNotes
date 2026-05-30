//
//  ContentView.swift
//  CallAPI
//
//  Created by Siddharth on 30/05/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel: UsersViewModel
    
    init() {
        let apiService = APIService()
        let repository = UserRepository(apiService: apiService)
        
        _viewModel = StateObject(
            wrappedValue: UsersViewModel(repository: repository)
        )
    }
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Users")
                .navigationDestination(for: User.self) { user in
                                    UserDetailView(user: user)
                                }
        }
        .task {
            await viewModel.fetchUsers()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            ProgressView("Loading...")
        } else if let error = viewModel.errorMessage {
            Text(error)
                .foregroundStyle(.red)
                .padding()
        } else {
            List(viewModel.users) { user in
                NavigationLink(value: user) {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        
                        Text(user.email)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

