//
//  ProductRating.swift
//  swiftui-project
//
//  Created by user238749 on 5/18/23.
//

import Foundation
import SwiftUI

struct Rating: View {
    var rating: Int
    
    var body: some View {
        HStack(spacing: UIConstants.smallSpacing) {
            Text("\(rating)")
            .font(.body)
            .foregroundColor(Color("Black"))
            .bold()
            
            ForEach(1...Limits.maxRating , id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .resizable()
                    .frame(width: UIConstants.ratingStar,height: UIConstants.ratingStar)
                    .foregroundColor(Color("TextColor"))
            }
        }
    }
}

struct Rating_Previews: PreviewProvider {
    static var previews: some View {
        Rating(rating: 1)
    }
}
