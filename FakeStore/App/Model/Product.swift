//
//  ProductFeed.swift
//  FakeStore
//
//  Created by Diggo Silva on 02/05/24.
//

import Foundation

struct Product: Codable {
    let id: Int
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
