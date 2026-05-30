//
//  UsersViewModel.swift
//  CallAPI
//
//  Created by Siddharth on 30/05/26.
//

import Combine
import Foundation

@MainActor
final class UsersViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    @Published var isLoading = false
    
    @Published var errorMessage: String?
    
    private let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchUsers() async {
        isLoading = true
        errorMessage = nil
        
        do {
            users = try await repository.getUsers()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
}
