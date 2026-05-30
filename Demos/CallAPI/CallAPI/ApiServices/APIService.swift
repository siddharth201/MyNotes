//
//  APIService.swift
//  CallAPI
//
//  Created by Siddharth on 30/05/26.
//

import Foundation

protocol APIServiceProtocol {
    func fetchUsers() async throws -> [User]
}

final class APIService: APIServiceProtocol {
    
    func fetchUsers() async throws -> [User] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}
