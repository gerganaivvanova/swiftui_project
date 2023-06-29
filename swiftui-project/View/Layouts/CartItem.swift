//
//  ProductCard.swift
//  swiftui-project
//
//  Created by user238749 on 6/9/23.
//

import Foundation
import SwiftUI

struct CartItem: View {
    var product: Product
    
    var body: some View {
                    
            HStack(spacing: 0){
                
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIConstants.cartImageWidth, height: UIConstants.cartImageWidth)
                            .cornerRadius(UIConstants.cornerRadius)
                            .padding(.trailing, UIConstants.padding)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
                
                VStack(alignment: .leading, spacing: UIConstants.smallSpacing){
                    
                    Text(product.title)
                        .font(.callout)
                        .bold()
                        .foregroundColor(Color("Black"))
                    
                    Text(String(format: "$%.2f", Double(product.price)))
                        .font(.callout)
                        .bold()
                        .foregroundColor(Color("Black"))
                    
                    Text("Quantity: 1")
                        .font(.caption)
                        .foregroundColor(Color("DarkGray"))
                }
                Spacer()
            }
            
             Divider()
            
        }
}
