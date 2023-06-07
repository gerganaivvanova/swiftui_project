//
//  PostRepository.swift
//  swiftui-project
//
//  Created by user238749 on 5/14/23.
//

import Foundation
import Factory
import Alamofire

class ProductRepository: ProductRepositoryProtocol {
      
    private let networkManager = Container.shared.networkManager()
    let BASE_URL = getValueFromPlist(withName: "BaseURL", forKey: "BASE_URL") as! String
      
    
    func fetchProductDetails(id: Int) async throws -> Product {
        let url = "\(BASE_URL)/products/\(id)?populate=*"
        return try await networkManager.request(url, method: .get) 
    }
    
    func fetchProducts() async throws -> [Product] {
        let url = "\(BASE_URL)/products?populate=*"
        return try await networkManager.request(url, method: .get)
    }
}
