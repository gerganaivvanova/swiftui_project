//
//  LoginRepository.swift
//  swiftui-project
//
//  Created by user238749 on 5/17/23.
//

import Foundation

func login(_ request: LoginRequest) async throws -> LoginResponse {
    let url = "https://ethereal-artefacts.fly.dev/api/auth/local"
    return try await networkManager.request(url, method: .post, parameters: request)
}
