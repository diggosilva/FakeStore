//
//  ProductFeed.swift
//  FakeStore
//
//  Created by Diggo Silva on 02/05/24.
//

import Foundation

struct ProductFeed: Codable {
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Double
    
    var priceFormatted: String {
        return "$\(String(format: "%.2f", price))"
    }
}

enum CategoryProduct: String {
    case electronics
    case jewelery
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}
