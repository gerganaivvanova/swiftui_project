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
    @State var product: Product
    @StateObject var productModel = ProductViewModel()
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        
        VStack(alignment: .center) {
                          
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
                    
                        HStack(spacing: UIConstants.spacing) {
                            if(product.stock > 0 ){
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text("In stock")
                                    .foregroundColor(Color("Black"))
                            } else {
                                Text("Out of stock")
                                    .foregroundColor(Color("ErrorColor"))
                            }
                        }
                        .padding(UIConstants.smallPadding)
                        .background(Color("BaseColor"))
                        .cornerRadius(UIConstants.mediumCornerRadius)
                        .padding(.vertical, UIConstants.smallPadding)
                        .padding(.horizontal, UIConstants.bigPadding)
                }
                
                VStack(alignment: .leading, spacing: UIConstants.smallSpacing) {
                    HStack(spacing: UIConstants.smallSpacing){
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
            
                Button(action: {
                    cartManager.cart.append(product)
                   product = productModel.reduceStock(for: product)
                }, label: {
                        Text("Add to cart")
                            .foregroundColor(.white)
                            .padding(.vertical, UIConstants.smallPadding)
                            .frame(maxWidth: .infinity)
                            .background(cartManager.cart.contains{$0.id == product.id} ? Color("DisabledColor") : Color("TextColor"))
                            .cornerRadius(UIConstants.mediumCornerRadius)
                    })
                .padding(.horizontal, UIConstants.bigPadding)
                .disabled(cartManager.cart.contains{$0.id == product.id})
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                CartButton(productsCounter: cartManager.cart.count)
            }
        }
        .navigationBarTitle("Product details", displayMode: .inline)
        .font(.title2)
        .background(Image("HomeScreenBackground")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all))
        }
    }
    
    
    
    struct ProductDetailsView_Previews: PreviewProvider {
        static var previews: some View {
            ProductDetailsView(product: Product(id: 1, title: "Test", description: "Test", shortDescription: "Test", stock: 1, price: 78, rating: 1, image: "Test", category: "Test"))
        }
    }
