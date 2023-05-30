//
//  RepositoryProtocol.swift
//  swiftui-project
//
//  Created by user238749 on 5/14/23.
//

import Foundation
 
protocol RepositoryProtocol {
    func login(request: LoginRequest) async throws -> LoginResponse
    
    func fetchProducts() async throws -> [Product]
    
    func fetchProductDetails(id: Int) async throws -> Product
}
