//
//  HomeScreenView.swift
//  swiftui-project
//
//  Created by user238749 on 6/7/23.
//

import Foundation
import SwiftUI

struct HomeScreenView: View {
    @StateObject var allProductsModel = HomeScreenViewModel()
    @State private var searchText = ""
    @State private var areFiltersPresented = false
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack(alignment: .center, spacing: UIConstants.smallSpacing) {
    
            HStack {
                Text("New products")
                    .font(.title2)
                    .padding(UIConstants.smallPadding)
                
                Spacer()
                Button(action: { areFiltersPresented = true }, label: {
                    ZStack(alignment: .topTrailing){
                        Image(systemName: "line.horizontal.3")
                            .font(.title2)
                            .foregroundColor(Color("Black"))
                        
                        if allProductsModel.appliedFilterCount > 0 {
                            Text("\(allProductsModel.appliedFilterCount)")
                                .font(.caption2).bold()
                                .foregroundColor(Color("BaseColor"))
                                .frame(width: UIConstants.labelsWidth, height: UIConstants.labelsWidth)
                                .background(Color("TextColor"))
                                .cornerRadius(UIConstants.largeCornerRadius)
                                .offset(x: UIConstants.offsetX, y: UIConstants.offsetY)
                       }
                    }
                    .padding()
                })
            }
            .padding()
            
            if (allProductsModel.isLoading) {
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
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Home")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                NavigationLink(destination: ProfileView()){
                    Image(systemName: "person.circle.fill")
                        .font(.title2)
                }.foregroundColor(Color("Black"))
                CartButton(productsCounter: cartManager.cart.count)
            }
        }
        .sheet(isPresented: $areFiltersPresented){
            FiltersSheet(
                
                allCategories: Set(allProductsModel.filteredProducts.map {$0.category}),
                isPresented: $areFiltersPresented,
                selectedRating: $allProductsModel.selectedRating,
                selectedPriceRange: $allProductsModel.selectedPriceRange,
                onApply: { selectedCategories in
                    allProductsModel.selectedCategories = selectedCategories
                    allProductsModel.applyFilters()
                },
             allProductsModel: allProductsModel
            )
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)

        .searchable(text: $searchText, prompt: "Search")
        .onChange(of: searchText){ searchedValue in
            allProductsModel.searchProducts(by: searchedValue)
            }
        
        .onAppear{allProductsModel.fetchAllProducts()}
        .background(Image("HomeScreenBackground")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
        )
    }
        
}
