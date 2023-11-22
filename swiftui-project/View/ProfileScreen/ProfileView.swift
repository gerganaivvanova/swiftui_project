//
//  ProductCard.swift
//  swiftui-project
//
//  Created by user238749 on 6/9/23.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @State private var navigateToLogIn = false

    var body: some View {
        VStack(spacing:UIConstants.bigSpacing){
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .foregroundColor(Color("TextColor"))
            
            Text("test@test.com")
            
            Divider()
            
            Spacer()
            Button(action: {
                navigateToLogIn = true}){
                    Text("Log out")
                        .foregroundColor(Color("BaseColor"))
                        .font(.callout)
                        .padding(.vertical, UIConstants.smallPadding)
                        .frame(maxWidth: .infinity)
                        .background(Color("TextColor"))
                        .cornerRadius(UIConstants.mediumCornerRadius)
                        .padding(.top, UIConstants.largePadding)
                }
        }
        .padding(.horizontal, UIConstants.bigPadding)
        .navigationDestination(isPresented: $navigateToLogIn, destination: {LoginView()})
    }
}

