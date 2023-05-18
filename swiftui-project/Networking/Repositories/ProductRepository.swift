//
//  PostRepository.swift
//  swiftui-project
//
//  Created by user238749 on 5/14/23.
//

import Foundation

class ProductRepository: RepositoryProtocol {
    private let networkManager = NetworkManager()

    func login(request: LoginRequest) async throws -> LoginResponse {
        let url = "https://ethereal-artefacts.fly.dev/api/auth/local"
        return try await networkManager.request(url, method: .post, parameters: request)
    }
    
    func fetchProductDetails(id: Int) async throws -> Product {
        let url = "https://ethereal-artefacts.fly.dev/api//products/\(id)?populate=*"
        return try await networkManager.request(url, method: .get) 
    }
    
    func fetchProducts() async throws -> [Product] {
        let url = "https://ethereal-artefacts.fly.dev/api/products?populate=*"
        return try await networkManager.request(url, method: .get)
    }
}
