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
    @Published var showModal = false
    @Published var isLoggingIn = false
    
    private let repository = Container.shared.loginRepository()
    
    func validateEmail(_ email: String) -> Bool {
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailPredicate.evaluate(with: email)
    }
    
    func isLogInButtonDisabled() -> Bool {
        return self.email.isEmpty || self.password.isEmpty || self.isLoggingIn
    }
    
    func login() {
        Task {
            do {
                self.isLoggingIn = true
                
                let request = LoginRequest(identifier: self.email, password: self.password)
                let loginResponse = try await repository.login(request: request)
                let jwtToken = loginResponse.jwt
                    // attach the jwtToken
                JWTStorage.shared.jwtToken = jwtToken
                self.isLoginValid = true
                                        
            } catch {
                print("Login error: \(error)")
                isLoggingIn = false
                self.password = "";
                showModal = true;
            }
        }
    }
    
}
