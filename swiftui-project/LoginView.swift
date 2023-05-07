//
//  ContentView.swift
//  swiftui-project
//
//  Created by user238749 on 5/6/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = "";
    @State private var password = "";
    @State private var isLoginValid = true;
    @State private var isPasswordVisible = false;
    @State private var isEmailValid = true;
    @State private var showModal = false;
    @State private var path: [String] = [];
    
    var body: some View {
        VStack{
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 160, alignment: .center)
                .padding(.top, 50)
            Spacer()
            
            Text("Log in")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(UIColor(named: "TextColor")!))
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.leading, 30)
            
            TextField("Email", text: $email, onEditingChanged: { isEditing in
                if !isEditing {
                    self.validateEmail()
                }
            })
            .autocapitalization(.none)
            .padding()
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.horizontal,26)
            .padding(.bottom,20)
            
            if !isEmailValid {
                Text("Invalid email")
                    .foregroundColor(.red)
                
            }
            HStack {
                if isPasswordVisible{
                    TextField("Password", text: $password)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(isLoginValid ? .black : .red)
                    
                } else {
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(isLoginValid ? .black : .red)
                }
                Button(action: {
                    self.isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.horizontal, 26)
                
                Button(action: {
                    self.validateLogin()
                }) {
                    Text("Log in")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 50)
                        .background(isLoginValid ? Color.blue : Color.gray)
                        .cornerRadius(5.0)
                        .padding(.top, 50)
                }
                .disabled(email.isEmpty || !isEmailValid || password.isEmpty);           Spacer()
                    }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Image("Login Background")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
        )
        .alert(isPresented: $showModal) {
            Alert(title: Text("Login Failed"),
                  message: Text("Your email or password is incorrect. Please try again."),
                  dismissButton: .default(Text("OK")))
        }    }
    
    
    private func validateEmail() {
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        self.isEmailValid = emailPredicate.evaluate(with: self.email)
    }
    
    private func validateLogin() {
        // For demo purposes, hardcoded valid credentials are used.
        let validEmail = "user@example.com"
        let validPassword = "password"
        
        if email.isEmpty || !isEmailValid || password.isEmpty {
            return
        }
        
        if email == validEmail && password == validPassword {
            // Login successful
            self.isLoginValid = true
            self.password = ""
        } else {
            // Login failed
            self.isLoginValid = false
            self.password = ""
            showModal = true;
            
        }}
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
        
        
    }
}
