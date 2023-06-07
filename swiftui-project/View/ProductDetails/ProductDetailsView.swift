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
                        .padding(UIConstants.basePadding)
                        .background(Color("Base Color"))
                        .cornerRadius(UIConstants.mediumCornerRadius)
                        .padding(.vertical, UIConstants.basePadding)
                        .padding(.horizontal, UIConstants.horizontalPadding) //30
                    })
                }
                
                
                VStack(alignment: .leading) {
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
                        .foregroundColor(Color("Dark Gray"))
                    
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
                .padding(.bottom, UIConstants.topBottomPadding)
            } else {
                ProgressView(){
                    Text("Loading...")
                                        }
                .padding()
            }
            
            Button(action: {}, label: {
                    Text("Add to cart")
                        .foregroundColor(.white)
                        //.frame(width: 340, height: 46)
                        .padding(.vertical, UIConstants.basePadding)
                        .frame(maxWidth: .infinity)
                        .background(Color("Textcolor"))
                        .cornerRadius(UIConstants.mediumCornerRadius)
                })
            .padding(.horizontal, UIConstants.horizontalPadding)
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
