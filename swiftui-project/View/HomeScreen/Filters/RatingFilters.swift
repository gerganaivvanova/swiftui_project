//
//  RatingFilters.swift
//  swiftui-project
//
//  Created by user238749 on 6/20/23.
//

import SwiftUI

struct RatingFilter: View {
    @Binding var selectedRating: Int
    
    var body: some View {
        HStack(spacing: UIConstants.smallSpacing) {
            Text("Rating")
            .font(.body)
            .foregroundColor(Color("Black"))
            
            Spacer()
            
            ForEach(1...Limits.maxRating , id: \.self) { index in
                Image(systemName: index <= selectedRating ? "star.fill" : "star")
                    .resizable()
                    .frame(width: UIConstants.bigRatingStar,height: UIConstants.bigRatingStar)
                    .foregroundColor(Color("TextColor"))
                    .onTapGesture {
                        selectedRating = selectedRating == index ? index - 1 : index
                    }
            }
        }
        .padding(UIConstants.padding)
    }
}


