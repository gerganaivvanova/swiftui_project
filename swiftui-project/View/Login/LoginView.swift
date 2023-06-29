//
//  ContentView.swift
//  swiftui-project
//
//  Created by user238749 on 5/6/23.
//

import SwiftUI

class CartManager: ObservableObject {
    @Published var cart: [Product] = []
    @Published var orderHistory: [Order] = []
}

struct LoginView: View {
    @StateObject var loginModel: LoginViewModel = LoginViewModel()
    @StateObject private var cartManager = CartManager()
    
    @State private var isPasswordVisible = false;
    @State private var isEmailValid = true;
    @State private var path: [String] = [];
    
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIConstants.width, height: UIConstants.height, alignment: .center)
                    .padding(.vertical, UIConstants.largePadding)
                
                Text("Log in")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color("TextColor"))
                    .frame(maxWidth:.infinity, alignment: .leading)
                
                TextField("", text: $loginModel.email, prompt: Text("Email").foregroundColor(Color("DarkGray")))
                    .autocapitalization(.none)
                    .font(.callout)
                    .foregroundColor(Color("DarkGray"))
                    .padding()
                    .background(Color("BaseColor"))
                    .cornerRadius(UIConstants.cornerRadius)
                    .padding(.bottom, UIConstants.padding)
                    .onChange(of: loginModel.email) {value in
                        self.isEmailValid = loginModel.validateEmail(value)
                    }
                if !isEmailValid {
                    Text("Invalid email")
                        .foregroundColor(Color("ErrorColor"))
                }
                
                HStack {
                    if isPasswordVisible{
                        TextField("", text: $loginModel.password, prompt: Text("Password").foregroundColor(Color("DarkGray")))
                            .autocapitalization(.none)
                            .font(.callout)
                            .foregroundColor(Color("DarkGray"))
                            .padding()
                            .background(Color("BaseColor"))
                    } else {
                        SecureField("", text: $loginModel.password, prompt: Text("Password")
                            .foregroundColor(Color("DarkGray")))
                            .autocapitalization(.none)
                            .padding()
                            .background(Color("BaseColor"))
                    }
                }
                .overlay(
                    Button(action: {
                        self.isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(Color("DarkGray"))
                    }
                        .padding(.trailing, UIConstants.smallPadding),
                    alignment: .trailing
                )
                .background(Color("BaseColor"))
                .cornerRadius(UIConstants.cornerRadius)
               
                Button(action:loginModel.login){
                        Text("Log in")
                            .foregroundColor(Color("BaseColor"))
                            .font(.callout)
                            .padding(.vertical, UIConstants.smallPadding)
                            .frame(maxWidth: .infinity)
                            .background(loginModel.isLogInButtonDisabled() ? Color("DisabledColor") : Color("TextColor"))
                            .cornerRadius(UIConstants.mediumCornerRadius)
                            .padding(.top, UIConstants.largePadding)
                    }
                .disabled(loginModel.isLogInButtonDisabled() || !self.isEmailValid)
                .navigationDestination(isPresented: $loginModel.isLoginValid, destination: {HomeScreenView()})
                .navigationBarHidden(true)
            }
            
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .padding(.horizontal,UIConstants.bigPadding)
            .background(Image("LoginBackground")
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
        .environmentObject(cartManager)
    }
}
