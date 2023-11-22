//
//  Order.swift
//  swiftui-project
//
//  Created by user238749 on 6/28/23.
//

import Foundation

struct Order: Identifiable {
    let id: Int
    let products: [Product]
    let date: Date
    let total: Double
}
