//
//  ProductCard.swift
//  swiftui-project
//
//  Created by user238749 on 6/9/23.
//

import Foundation
import SwiftUI

struct ProductCard: View {
    var product: Product
    
    var body: some View {
        VStack(spacing:20){
            HStack{
                
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIConstants.smallWidth, height: UIConstants.smallHeight)
                            .cornerRadius(UIConstants.cornerRadius)
                            .padding(.trailing, UIConstants.padding)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
                
                
                VStack(alignment: .leading, spacing: UIConstants.smallSpacing){
                    Text("Category: \(product.category)")
                        .font(.caption)
                        .foregroundColor(Color("DarkGray"))
                        .padding(.vertical, UIConstants.smallPadding)
                    
                    Text(product.title)
                        .font(.callout)
                        .bold()
                        .foregroundColor(Color("Black"))
                        .multilineTextAlignment(.leading)
                    
                    Text(product.shortDescription)
                        .font(.footnote)
                        .foregroundColor(Color("DarkGray"))
                        .multilineTextAlignment(.leading)
                    
                    Rating(rating: product.rating)
                    
                    Text(String(format: "$%.2f", Double(product.price)))
                        .font(.callout)
                        .foregroundColor(Color("Black"))
                }
                .frame(maxWidth: UIConstants.minTextWidth)
            }
            .padding(.leading, UIConstants.padding)
            
            Divider()
                .padding(.horizontal, UIConstants.bigPadding)
        }
    }
    
    struct ProductCard_Previews: PreviewProvider {
        static var previews: some View {
            ProductCard(product: Product(id: 1, title: "Test", description: "Test", shortDescription: "Test", stock: 1, price: 78, rating: 1, image: "Test", category: "Test"))
        }
    }
}
