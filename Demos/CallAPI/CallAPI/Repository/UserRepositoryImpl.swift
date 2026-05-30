//
//  UserRepositoryImpl.swift
//  CallAPI
//
//  Created by Siddharth on 30/05/26.
//

final class UserRepository: UserRepositoryProtocol {
    
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func getUsers() async throws -> [User] {
        try await apiService.fetchUsers()
    }
}
