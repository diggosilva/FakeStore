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
    let category: Category
    let image: String
    let rating: Double
    
    struct Category: Codable {
        let electronics: String
        let jewelery: String
        let menSClothing: String
        let womenSClothing: String
        
        enum CodgingKeys: String, CodingKey {
            case electronics = "electronics"
            case jewelery = "jewelery"
            case menSClothing = "men's clothing"
            case womenSClothing = "women's clothing"
        }
    }
}
