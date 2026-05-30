//
//  User.swift
//  CallAPI
//
//  Created by Siddharth on 30/05/26.
//

struct User: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let email: String
    let phone: String
}
