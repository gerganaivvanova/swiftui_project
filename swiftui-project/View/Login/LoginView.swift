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
                    .frame(width: UIConstants.logoWidth, height: UIConstants.logoHeight, alignment: .center)
                    .padding(.vertical, UIConstants.topBottomPadding)
                
                Text("Log in")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Textcolor"))
                    .frame(maxWidth:.infinity, alignment: .leading)
                
                TextField("", text: $loginModel.email, prompt: Text("Email").foregroundColor(Color("Dark Gray")))
                    .autocapitalization(.none)
                    .font(.callout)
                    .foregroundColor(Color("Dark Gray"))
                    .padding()
                    .background(Color("Base Color"))
                    .cornerRadius(UIConstants.cornerRadius)
                    .padding(.bottom, UIConstants.padding)
                    .onChange(of: loginModel.email) {value in
                        self.isEmailValid = loginModel.validateEmail(value)
                    }
                if !isEmailValid {
                    Text("Invalid email")
                        .foregroundColor(Color("Error Color"))
                }
                
                HStack {
                    if isPasswordVisible{
                        TextField("", text: $loginModel.password, prompt: Text("Password").foregroundColor(Color("Dark Gray")))
                            .autocapitalization(.none)
                            .font(.callout)
                            .foregroundColor(Color("Dark Gray"))
                            .padding()
                            .background(Color("Base Color"))
                    } else {
                        SecureField("", text: $loginModel.password, prompt: Text("Password")
                            .foregroundColor(Color("Dark Gray")))
                            .autocapitalization(.none)
                            .padding()
                            .background(Color("Base Color"))
                    }
                }
                .overlay(
                    Button(action: {
                        self.isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(Color("Dark Gray"))
                    }
                        .padding(.trailing, UIConstants.basePadding),
                    alignment: .trailing
                )
                .background(Color("Base Color"))
                .cornerRadius(UIConstants.cornerRadius)
               
                Button(action:loginModel.login){
                        Text("Log in")
                            .foregroundColor(Color("Base Color"))
                            .font(.callout)
                            .padding(.vertical, UIConstants.basePadding)
                            .frame(maxWidth: .infinity)
                            .background(loginModel.isLogInButtonDisabled() ? Color("Disabled Color") : Color("Textcolor"))
                            .cornerRadius(UIConstants.mediumCornerRadius)
                            .padding(.top, UIConstants.topBottomPadding)
                    }
                .disabled(loginModel.isLogInButtonDisabled() || !self.isEmailValid)
                .navigationDestination(isPresented: $loginModel.isLoginValid, destination: {ProductDetailsView()})
            }
            
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .padding(.horizontal,UIConstants.horizontalPadding)
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
