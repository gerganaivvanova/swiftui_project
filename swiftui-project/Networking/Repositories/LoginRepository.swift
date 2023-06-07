//
//  LoginRepository.swift
//  swiftui-project
//
//  Created by user238749 on 5/17/23.
//

import Foundation
import Factory
import Alamofire

class LoginRepository: LoginRepositoryProtocol {
      
    private let networkManager = Container.shared.networkManager()
    let BASE_URL = getValueFromPlist(withName: "BaseURL", forKey: "BASE_URL") as! String
    
    func login(request: LoginRequest) async throws -> LoginResponse {
        let url = "\(BASE_URL)/auth/local"
        return try await networkManager.request(url, method: .post, parameters: request)
        
    }
    
}
