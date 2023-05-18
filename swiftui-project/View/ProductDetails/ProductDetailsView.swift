//
//  HomePageView.swift
//  swiftui-project
//
//  Created by user238749 on 5/7/23.
//

import SwiftUI
import Factory
import Alamofire

struct ProductDetailsView: View {
    @StateObject var productModel = ProductViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Spacer()
                Text("Product details")
                    .font(.title3)
                
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "cart.fill")
                        .font(.title2)
                        .foregroundColor(.black)
                })
            }
            .padding(.horizontal)
            
            if let product = productModel.product{
                              
                ZStack(alignment: .topTrailing) {
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                    
                    Button(action: {}, label: {
                        HStack(spacing: 4) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("In stock")
                                .foregroundColor(.black)
                            
                        }
                        .padding(10)
                        .background(.white)
                        .cornerRadius(26)
                        .padding(.vertical,15)
                        .padding(.horizontal, 30)
                    })
                }
                
                
                VStack(alignment: .leading) {
                    HStack(spacing:1){
                        Text(product.title)
                            .font(.title3)
                            .bold()
                        Spacer()
                        
                        Rating(rating: product.rating)
                            .padding(.trailing)
                    }
                    
                    Text("Category: \(product.category)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text(product.description)
                        .font(.body)
                        .lineLimit(nil)
                        .padding(.vertical)
                        .frame(width: 300)
                    
                    Text(String(format: "$%.2f", Double(product.price)))
                        .font(.title)
                        .bold()
                        .padding(.vertical)
                }
                .padding(.horizontal,20)
                .padding(.bottom,50)
            }
                Button(action: {}, label: {
                    Text("Add to cart")
                        .foregroundColor(.white)
                        .frame(width: 340, height: 46)
                        .background(Color("TextColor"))
                        .cornerRadius(26)
                })
                .padding(.horizontal,25)
            
            //} else {
            // ProgressView()
            //}            }
            
            .navigationBarBackButtonHidden(true)
            .onAppear{
                productModel.fetchProductDetails()
            }           
        }
    }
    
    
    
    struct ProductDetailsView_Previews: PreviewProvider {
        static var previews: some View {
            ProductDetailsView()
        }
    }
}
