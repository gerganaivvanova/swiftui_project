//
//  CategoryFiltersView.swift
//  swiftui-project
//
//  Created by user238749 on 6/20/23.
//
import SwiftUI

struct CategoryFilters: View {
    var allCategories: [String]
    @State var isExpanded = false
    @Binding var selectedCategories: Set<String>

    var body: some View {
        VStack{
            Button(
                action: {isExpanded = !isExpanded}
            ) {
                HStack {
                    Text("Category")
                        .font(.callout)
                        .foregroundColor(Color("Black"))
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(Color("Black"))
                }
                
            }
            
            if isExpanded {
                ForEach(Array(allCategories.enumerated()), id: \.offset) { index, category in
                    Button(
                        action: {modifySelectedCategories(with: category)}
                    ){
                        VStack{
                            HStack{
                                Text("\(category)")
                                    .foregroundColor(Color("Black"))
                                    .padding(UIConstants.smallPadding)
                                Spacer()
                                if selectedCategories.contains(category)
                                {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(UIConstants.padding)
    }
    
    func modifySelectedCategories(with category: String) {
        if selectedCategories.contains(category) {
            selectedCategories.remove(category)
        } else {
            selectedCategories.insert(category)
        }
    }}

