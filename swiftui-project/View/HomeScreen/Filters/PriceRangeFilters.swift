//
//  PriceRangeFilters.swift
//  swiftui-project
//
//  Created by user238749 on 6/20/23.
//

import Sliders
import SwiftUI

struct PriceRangeFilters: View {
    var calculatedPriceRange: ClosedRange<Double>
    @Binding var selectedPriceRange: ClosedRange<Double>

    var body: some View {
        VStack(alignment: .leading) {
            Text("Price range")
            
            RangeSlider(range: $selectedPriceRange, in: calculatedPriceRange, step: 1)
                .rangeSliderStyle(
                    HorizontalRangeSliderStyle(
                    track:
                        HorizontalRangeTrack(
                            view: Capsule().foregroundColor(Color("TextColor"))
                        )
                        .background(Capsule().foregroundColor(Color("DisabledColor")))
                        .frame(height: UIConstants.spacing),
                    lowerThumb: Circle().foregroundColor(Color("TextColor")),
                    upperThumb: Circle().foregroundColor(Color("TextColor")),
                    lowerThumbSize: CGSize(width: UIConstants.rangeFilterWidth, height: UIConstants.rangeFilterWidth),
                    upperThumbSize: CGSize(width: UIConstants.rangeFilterWidth, height: UIConstants.rangeFilterWidth),
                    options: .forceAdjacentValue
                    )
                )
            
            HStack{
                Text(String(format: "$%.2f", selectedPriceRange.lowerBound))
                Spacer()
                Text(String(format: "$%.2f", selectedPriceRange.upperBound))
            }
            Spacer()
        }
        .padding(UIConstants.padding)
    }
}
