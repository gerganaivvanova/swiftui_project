//
//  LoginRepositoryProtocol.swift
//  swiftui-project
//
//  Created by user238749 on 6/7/23.
//

import Foundation
 
protocol LoginRepositoryProtocol {
    func login(request: LoginRequest) async throws -> LoginResponse
}
