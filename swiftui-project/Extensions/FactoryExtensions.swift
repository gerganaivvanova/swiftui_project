//
//  FactoryExtensions.swift
//  swiftui-project
//
//  Created by user238749 on 5/14/23.
//

import Factory

extension Container {
    var networkManager: Factory<NetworkManager> {
        self { NetworkManager() }
            .singleton
    }
    
    var productRepository: Factory<ProductRepository> {
        self { ProductRepository() }
    }
}