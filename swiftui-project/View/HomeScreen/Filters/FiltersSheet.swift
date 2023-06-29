//
//  FiltersSheet.swift
//  swiftui-project
//
//  Created by user238749 on 6/20/23.
//

import SwiftUI

struct FiltersSheet: View {
    var allCategories: Set<String> = Set()
    @Binding var isPresented: Bool
    @Binding var selectedRating: Int
    @State var selectedCategories: Set<String> = Set()
    @Binding var selectedPriceRange: ClosedRange<Double>
    var onApply: (Set<String>) -> ()
    var allProductsModel: HomeScreenViewModel
    
    var body: some View {
        VStack{
            ZStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Text("Filters").font(.title2)
                    Spacer()
                }
                
                Button(action: applyFilters) {
                    Text("Apply")
                        .font(.callout)
                        .foregroundColor(Color("Black"))
                }
            }
                Divider()
                CategoryFilters(
                    allCategories: Array(allCategories),
                    selectedCategories: $selectedCategories
                )
            
                Divider()
            
                PriceRangeFilters(calculatedPriceRange: allProductsModel.calculatedPriceRange,
                                  selectedPriceRange: $selectedPriceRange
                )
            
                Divider()
            
                RatingFilter(selectedRating: $selectedRating)

                Spacer()
       }
        .padding(UIConstants.padding)
        .onChange(of: selectedRating){ rating in
            allProductsModel.filterByRating(rating)
        }
    }
    
    func applyFilters() {
        onApply(selectedCategories)
        isPresented = false
    }
}

