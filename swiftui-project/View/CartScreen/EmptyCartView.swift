//
//  CartButton.swift
//  swiftui-project
//
//  Created by user238749 on 6/9/23.
//
import SwiftUI

struct EmptyCartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
                    Image("HomeScreenBackground")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Image("CartImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIConstants.width, height: UIConstants.height)
                        
                        Text("Your cart is empty")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }
    }
}
