//
//  JWTStorage.swift
//  swiftui-project
//
//  Created by user238749 on 5/20/23.
//

import Foundation

class JWTStorage {
    static let shared = JWTStorage() // Singleton instance
    
    var jwtToken: String?
    
    private init() {}
}
