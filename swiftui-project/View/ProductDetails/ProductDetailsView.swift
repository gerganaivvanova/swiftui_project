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
        
        VStack(alignment: .center) {
            
            HStack {
                Spacer()
                Text("Product details")
                    .font(.title2)
                
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
                    AsyncImage(url: URL(string: product.image)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(UIConstants.cornerRadius)
                                .padding(.horizontal, UIConstants.padding)
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    Button(action: {}, label: {
                        HStack(spacing: UIConstants.mediumSpacing) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("In stock")
                                .foregroundColor(.black)
                            
                        }
                        .padding(UIConstants.smallPadding)
                        .background(Color("BaseColor"))
                        .cornerRadius(UIConstants.mediumCornerRadius)
                        .padding(.vertical, UIConstants.smallPadding)
                        .padding(.horizontal, UIConstants.bigPadding)
                    })
                }
                
                
                VStack(alignment: .leading, spacing: UIConstants.spacing) {
                    HStack(spacing: UIConstants.spacing){
                        Text(product.title)
                            .font(.title2)
                            .bold()
                        Spacer()
                        
                        Rating(rating: product.rating)
                            .padding(.trailing)
                    }
                    
                    Text("Category: \(product.category)")
                        .font(.caption)
                        .foregroundColor(Color("DarkGray"))
                    
                    Text(product.description)
                        .font(.callout)
                        .lineLimit(nil)
                        .padding(.vertical)
                        .frame(width: UIConstants.textWidth)
                    
                    Text(String(format: "$%.2f", Double(product.price)))
                        .font(.title)
                        .bold()
                        .padding(.vertical)
                }
                .padding(.horizontal, UIConstants.padding)
                .padding(.bottom, UIConstants.largePadding)
            } else {
                ProgressView(){
                    Text("Loading...")
                                        }
                .padding()
            }
            
            Button(action: {}, label: {
                    Text("Add to cart")
                        .foregroundColor(.white)
                        .padding(.vertical, UIConstants.smallPadding)
                        .frame(maxWidth: .infinity)
                        .background(Color("TextColor"))
                        .cornerRadius(UIConstants.mediumCornerRadius)
                })
            .padding(.horizontal, UIConstants.bigPadding)
        }
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
