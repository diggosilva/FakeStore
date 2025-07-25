//
//  CartViewModel.swift
//  FakeStore
//
//  Created by Diggo Silva on 24/07/25.
//

import Foundation
import Combine

protocol CartViewModelProtocol {
    var cartItemsPublisher: AnyPublisher<[Product], Never> { get }
    var currentCartItems: [Product] { get }
    var cartTotal: Double { get }

    func loadCartItems()
    func removeItem(at index: Int)
}

class CartViewModel: CartViewModelProtocol {

    private let _cartItemsSubject = CurrentValueSubject<[Product], Never>([])
    var cartItemsPublisher: AnyPublisher<[Product], Never> {
        return _cartItemsSubject.eraseToAnyPublisher()
    }

    var currentCartItems: [Product] {
        return _cartItemsSubject.value
    }

    var cartTotal: Double {
        return CartManager.shared.cartTotal
    }

    private var cancellables = Set<AnyCancellable>()

    init() {
        CartManager.shared.cartItemsPublisher
            .sink { [weak self] items in
                self?._cartItemsSubject.send(items)
            }
            .store(in: &cancellables)
    }

    func loadCartItems() {
        _cartItemsSubject.send(CartManager.shared.currentCartItems)
    }

    func removeItem(at index: Int) {
        let currentItems = _cartItemsSubject.value
        if index < currentItems.count {
            let productToRemove = currentItems[index]
            CartManager.shared.removeProduct(product: productToRemove)
        }
    }
}
