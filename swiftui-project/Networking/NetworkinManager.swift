//
//  NetworkinManager.swift
//  swiftui-project
//
//  Created by user238749 on 5/14/23.
//

import Foundation
import Alamofire

class NetworkManager {
    private let session: Session
    
    init(jwtToken: String) {
        // Create custom session configuration
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // Set custom timeout
        
        // Initialize the custom session with the configuration
        self.session = Session(configuration: configuration, interceptor: JWTInterceptor(jwtToken: jwtToken))
    }
    
    func request<T: Decodable>(_ url: String, method: HTTPMethod = .get, parameters: [String: Any]? = nil) async throws -> T {
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

class JWTInterceptor: RequestInterceptor {
    private let jwtToken: String
    
    init(jwtToken: String) {
        self.jwtToken = jwtToken
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var adaptedRequest = urlRequest
        adaptedRequest.setValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        completion(.success(adaptedRequest))    }
}
