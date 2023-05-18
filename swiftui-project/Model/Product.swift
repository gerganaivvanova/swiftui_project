//
//  Product.swift
//  swiftui-project
//
//  Created by user238749 on 5/14/23.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let short_description: String
    let stock: Int
    let price: Int
    let rating: Int
    let image: String
    let category: String
}
