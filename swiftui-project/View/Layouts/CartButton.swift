//
//  CartButton.swift
//  swiftui-project
//
//  Created by user238749 on 6/9/23.
//
import SwiftUI

struct CartButton: View {
    var productsCounter: Int = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(systemName: "cart.fill")
                .font(.title2)
            
            if productsCounter > 0 {
                Text("\(productsCounter)")
                    .font(.caption2).bold()
                    .foregroundColor(Color("BaseColor"))
                    .frame(width: 15, height: 15)
                    .background(Color("TextColor"))
                    .cornerRadius(UIConstants.largeCornerRadius)
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(productsCounter: 1)
    }
}
