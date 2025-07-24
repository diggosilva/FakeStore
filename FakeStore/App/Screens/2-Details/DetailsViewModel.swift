//
//  DetailsViewModel.swift
//  FakeStore
//
//  Created by Diggo Silva on 21/07/25.
//

import UIKit

protocol DetailsViewModelProtocol {
    var product: Product { get }
    func addProductToCart()
}

class DetailsViewModel: DetailsViewModelProtocol {
    
    let product: Product
    
    init(product: Product) {
         self.product = product
     }
    
    func addProductToCart() {
        CartManager.shared.addProduct(product: product)
    }
}
