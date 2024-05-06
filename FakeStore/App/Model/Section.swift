//
//  Section.swift
//  FakeStore
//
//  Created by Diggo Silva on 03/05/24.
//

import Foundation

enum CategoryProduct: String {
    case electronics
    case jewelery
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

class Section {
    let list: [ProductFeed]
    let categoryProduct: CategoryProduct
    
    init(categoryProduct: CategoryProduct, list: [ProductFeed]) {
        self.categoryProduct = categoryProduct
        self.list = list.filter({ $0.category == categoryProduct.rawValue })
    }
}
