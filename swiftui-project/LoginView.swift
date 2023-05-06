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
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(10.0)
                .padding(.horizontal,30)
                .foregroundColor(isLoginValid ? .black : .red)
                .padding(.bottom,20)
                
                HStack {
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .padding(.horizontal, 30)
                        .foregroundColor(isLoginValid ? .black : .red)
                    
                    Button(action: {
                        self.isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 20)
                    .background(Color.white)
                    .cornerRadius(10.0)
                }
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
            Spacer()
        }
           .frame(maxWidth: .infinity,maxHeight: .infinity)
           .background(Image("Login Background")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            )
    }
    private func validateLogin() {
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
            }
        }}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
    
    
}
