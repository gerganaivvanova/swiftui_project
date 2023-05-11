//
//  ContentView.swift
//  swiftui-project
//
//  Created by user238749 on 5/6/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginModel: LoginViewModel = LoginViewModel()
    
    @State private var isPasswordVisible = false;
    @State private var isEmailValid = true;
    
    @State private var path: [String] = [];
    
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 160, alignment: .center)
                    .padding(.top, 50)
                    .padding(.bottom,50)
                
                Text("Log in")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("TextColor"))
                    .frame(maxWidth:.infinity, alignment: .leading)
                
                TextField("Email", text: $loginModel.email)
                    .autocapitalization(.none)
                    .padding()
                    .background(.white)
                    .cornerRadius(10.0)
                    .padding(.bottom,20)
                    .onChange(of: loginModel.email) {value in
                        self.isEmailValid = loginModel.validateEmail(value)
                    }
                if !isEmailValid {
                    Text("Invalid email")
                        .foregroundColor(.red)
                }
                
                HStack {
                    if isPasswordVisible{
                        TextField("Password", text: $loginModel.password)
                            .autocapitalization(.none)
                            .padding()
                            .background(.white)
                            .foregroundColor(loginModel.isLoginValid ? .black : .red)
                    } else {
                        SecureField("Password", text: $loginModel.password)
                            .autocapitalization(.none)
                            .padding()
                            .background(.white)
                    }
                }
                .overlay(
                    Button(action: {
                        self.isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                        .padding(.trailing, 10),
                    alignment: .trailing
                )
                .background(.white)
                .cornerRadius(10.0)
               
                Button(action:loginModel.validateLogin){
                        Text("Log in")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                            .background(loginModel.isLogInButtonDisabled() ? .gray : .blue)
                            .cornerRadius(5.0)
                            .padding(.top, 50)
                    }
                .disabled(loginModel.email.isEmpty || loginModel.password.isEmpty)
                .navigationDestination(isPresented: $loginModel.isLoginValid, destination: {ProductDetailsView()})
            }
            
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .padding(.horizontal,26)
            .background(Image("Login Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            )
            .alert(isPresented: $loginModel.showModal) {
                Alert(title: Text("Login Failed"),
                      message: Text("Your email or password is incorrect. Please try again."),
                      dismissButton: .default(Text("OK")))
            }
            
        }
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
        
        
    }
}
