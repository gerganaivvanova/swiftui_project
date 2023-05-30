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
    let email: String
}

struct LoginRequest: Encodable {
    let identifier: String
    let password: String
}
