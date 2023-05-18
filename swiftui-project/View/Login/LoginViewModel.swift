//
//  LoginViewModel.swift
//  swiftui-project
//
//  Created by user238749 on 5/11/23.
//

import Foundation
import Factory

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoginValid = false
    @Published var areCredentialsValid = false
    @Published var showModal = false
    @Published var isLoggingIn = false
    
    private let repository: RepositoryProtocol
    
    func validateEmail(_ email: String) -> Bool {
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailPredicate.evaluate(with: email)
    }
    
    func validateLogin() {
        // For demo purposes, hardcoded valid credentials are used.
        let validEmail = "test@test.com"
        let validPassword = "test123"

        if email == validEmail && password == validPassword {
            // Login successful
            self.areCredentialsValid = true
            self.password = ""
        } else {
            // Login failed
            self.areCredentialsValid = false
            self.password = ""
            showModal = true;
            
        }
        
    }
    
    func isLogInButtonDisabled() -> Bool {
        return self.email.isEmpty || self.password.isEmpty
    }
    
    func login() {
        Task {
            do {
                self.isLoggingIn = true
                self.validateLogin()
                
                if areCredentialsValid {
                    let request = LoginRequest(email: self.email, password: self.password)
                    let loginResponse = try await repository.login(request: request)
                    let jwtToken = loginResponse.jwt
                    // attach the jwtToken
                    let networkManager = NetworkManager(jwtToken: jwtToken)

                    self.isLoginValid = true
                }
                
                
            } catch {
                print("Login error: \(error)")
                isLoggingIn = false
            }
        }
    }
    
}
