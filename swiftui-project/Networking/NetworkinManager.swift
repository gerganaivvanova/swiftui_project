//
//  NetworkinManager.swift
//  swiftui-project
//
//  Created by user238749 on 5/14/23.
//

import Foundation
import Alamofire
import Factory

class NetworkManager {
    private let session: Session
    
    init() {
        // Create custom session configuration
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // Set custom timeout
        self.session = Session(configuration: configuration, interceptor: JWTInterceptor())
    }
    
    func request<T: Decodable>(_ url: String, method: HTTPMethod = .get, parameters: LoginRequest? = nil) async throws -> T {
            try await withCheckedThrowingContinuation { continuation in
                session.request(url, method: method, parameters: parameters)
                    .validate()
                    .responseDecodable(of: T.self) { response in
                        switch response.result {
                        case .success(let data):
                            continuation.resume(returning: data)
                        case .failure(let error):
                            continuation.resume(throwing: error)
                        }
                    }
            }
        }
}

