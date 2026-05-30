//
//  UserRepository.swift
//  CallAPI
//
//  Created by Siddharth on 30/05/26.
//

protocol UserRepositoryProtocol {
    func getUsers() async throws -> [User]
}


