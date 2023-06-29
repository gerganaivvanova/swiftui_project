//
//  CartButton.swift
//  swiftui-project
//
//  Created by user238749 on 6/9/23.
//
import SwiftUI

struct CartButton: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var isCartEmpty: Bool = true
    var productsCounter: Int = 0
    
    var body: some View {
        NavigationLink(destination: CartScreenView()){
            ZStack(alignment: .topTrailing){
                Image(systemName: "cart.fill")
                    .font(.title2)
                
                if productsCounter > 0 {
                    Text("\(productsCounter)")
                        .font(.caption2).bold()
                        .foregroundColor(Color("BaseColor"))
                        .frame(width: UIConstants.labelsWidth, height: UIConstants.labelsWidth)
                        .background(Color("TextColor"))
                        .cornerRadius(UIConstants.largeCornerRadius)
               }
            }
            .onReceive(cartManager.$cart){ cart in
                isCartEmpty = cart.isEmpty
            }
        }
        .foregroundColor(Color("Black"))
    }
}
