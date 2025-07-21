//
//  FeedViewModel.swift
//  FakeStore
//
//  Created by Diggo Silva on 02/05/24.
//

import Foundation
import Combine

enum FeedViewControllerStates {
    case loading
    case loaded
    case error
}

protocol FeedViewModelProtocol: StatefulViewModel where State == FeedViewControllerStates {
    func numberOfProducts() -> Int
    func cellForRowAt(indexPath: IndexPath) -> Product
    func fetchProducts()
}

class FeedViewModel: FeedViewModelProtocol {
    
    private let service = Service()
    private var products: [Product] = []
    
    @Published private var state: FeedViewControllerStates = .loading
    @Published private(set) var filteredProducts: [Product] = []
    
    var statePublisher: AnyPublisher<FeedViewControllerStates, Never> {
        $state.eraseToAnyPublisher()
    }
    
    func numberOfProducts() -> Int {
        return filteredProducts.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Product {
        return filteredProducts[indexPath.row]
    }
    
    func filterProducts(for category: String?) {
        if let category = category {
            filteredProducts = products.filter { $0.category.lowercased() == category.lowercased() }
        } else {
            filteredProducts = products
        }
    }
    
    func fetchProducts() {
        service.getProducts { produtos in
            self.products.append(contentsOf: produtos)
            self.filteredProducts = self.products
            self.state = .loaded
            
        } onError: { error in
            self.state = .error
        }
    }
}
