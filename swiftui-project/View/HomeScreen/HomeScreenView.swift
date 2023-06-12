//
//  HomeScreenView.swift
//  swiftui-project
//
//  Created by user238749 on 6/7/23.
//

import Foundation
import SwiftUI

struct HomeScreenView: View {
    @StateObject var allProductsModel = HomeScreenViewModel(allProducts: [])
    @State private var searchText = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: UIConstants.smallSpacing) {
    
            HStack {
                Text("New products")
                    .font(.title2)
                    .padding(UIConstants.smallPadding)
                
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(Color("Black"))
                        .padding()
                })
            }
            .padding()
            
            if allProductsModel.allProducts.isEmpty {
                ProgressView(){
                    Text("Loading...")
                }
                .padding()
                Spacer()
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(allProductsModel.filteredProducts, id: \.id){
                            product in
                            NavigationLink{
                                ProductDetailsView(product: product)
                            } label:{
                                ProductCard(product: product)
                            }
                        }
                    }
                }
                Spacer()
            }
    }
        .navigationBarTitle("Home")
        .font(.title2)
        .navigationBarBackButtonHidden(true)
        .searchable(text: $searchText, prompt: "Search")
        .onChange(of: searchText){ searchedValue in
            allProductsModel.filterProducts(by: searchedValue)
            }
        
        .onAppear{allProductsModel.fetchAllProducts()}
        .navigationBarItems(trailing:
            HStack(spacing: UIConstants.bigSpacing){
                Image(systemName: "person.circle.fill")
                .font(.title2)
                        
                CartButton(productsCounter: 4)
                .font(.title2)
            }
        )
        .background(Image("HomeScreenBackground")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
        )
        
    }
}
    
    struct HomeScreenView_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreenView()
        }
        
}
