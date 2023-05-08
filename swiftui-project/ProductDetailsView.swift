//
//  HomePageView.swift
//  swiftui-project
//
//  Created by user238749 on 5/7/23.
//

import SwiftUI

struct ProductDetailsView: View {
    
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
                            .foregroundColor(Color.black)
                    })
                }
                .padding(.horizontal)
                
                ZStack(alignment: .topTrailing) {
                    Image("ProductDetails")
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
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .background(Color.white)
                        .cornerRadius(26)
                        .padding(.vertical,15)
                        .padding(.horizontal, 30)
                    })
                }
                
                
                VStack(alignment: .leading) {
                    HStack(spacing:1){
                        Text("Stargazer's Tea Set")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Text("5")
                            .font(.headline)
                            .bold()
                        Image(systemName: "star.fill")
                            .font(.subheadline)
                            .foregroundColor(Color(UIColor(named: "TextColor")!))
                        Image(systemName: "star.fill")
                            .font(.subheadline)
                            .foregroundColor(Color(UIColor(named: "TextColor")!))
                        Image(systemName: "star.fill")
                            .font(.subheadline)
                            .foregroundColor(Color(UIColor(named: "TextColor")!))
                        Image(systemName: "star.fill")
                            .font(.subheadline)
                            .foregroundColor(Color(UIColor(named: "TextColor")!))
                        Image(systemName: "star.fill")
                            .font(.subheadline)
                            .foregroundColor(Color(UIColor(named: "TextColor")!))
                    }
                    
                    Text("Category: Home")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text("Indulge in a heavenly tea experience with our Stargazer’s Tea Set, featuring a constellation-themed teapot and matching teacups. Crafted from fine porcelain, this elegant set will transport you to the cosmos with every sip.")
                        .font(.body)
                        .lineLimit(nil)
                        .padding(.vertical)
                        .frame(width: 300)
                    
                    Text("$90.00")
                        .font(.title)
                        .bold()
                        .padding(.vertical)
                }
                .padding(.horizontal,20)
                .padding(.bottom,50)
                
                Button(action: {}, label: {
                    Text("Add to cart")
                        .foregroundColor(.white)
                        .frame(width: 340, height: 46)
                        .background(Color(UIColor(named: "TextColor")!))
                        .cornerRadius(26)
                })
                .padding(.horizontal,25)
            }
            .navigationBarBackButtonHidden(true)

        }
    }


struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}
