//
//  LoginViewModel.swift
//  swiftui-project
//
//  Created by user238749 on 5/11/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoginValid = false
    @Published var showModal = false
    
    func validateEmail(_ email: String) -> Bool {
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailPredicate.evaluate(with: email)
    }
    
    func validateLogin() {
        // For demo purposes, hardcoded valid credentials are used.
        let validEmail = "user@example.com"
        let validPassword = "password"

        if email == validEmail && password == validPassword {
            // Login successful
            self.isLoginValid = true
            self.password = ""
        } else {
            // Login failed
            self.isLoginValid = false
            self.password = ""
            showModal = true;
            
        }
        
    }
    
    func isLogInButtonDisabled() -> Bool {
        return self.email.isEmpty || self.password.isEmpty
    }
    
}
