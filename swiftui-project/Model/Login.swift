//
//  Login.swift
//  swiftui-project
//
//  Created by user238749 on 5/17/23.
//

import Foundation

struct LoginResponse: Codable {
    let jwt: String
    let user: User
}

struct User: Codable {
    let id: Int
    let username: String
    let email: String
    let provider: String
    let confirmed: Bool
    let blocked: Bool
}

struct LoginRequest: Encodable {
    let email: String
    let password: String
}
