//
//  DetailsViewModel.swift
//  FakeStore
//
//  Created by Diggo Silva on 21/07/25.
//

import UIKit

protocol DetailsViewModelProtocol {
    var product: Product { get }
}

class DetailsViewModel: DetailsViewModelProtocol {
    
    let product: Product
    
    init(product: Product) {
         self.product = product
     }
}
