//
//  CartManager.swift
//  FakeStore
//
//  Created by Diggo Silva on 23/07/25.
//

import Foundation
import Combine

class CartManager {
    
    static let shared = CartManager()
    
    private var cartItemsSubject = CurrentValueSubject<[Product], Never>([])
    
    var cartItemsPublisher: AnyPublisher<[Product], Never> {
        return cartItemsSubject.eraseToAnyPublisher()
    }
    
    var currentCartItems: [Product] {
        return cartItemsSubject.value
    }
    
    private init() {}
    
    func addProduct(product: Product) {
        var currentItems = cartItemsSubject.value
        currentItems.append(product)
        cartItemsSubject.send(currentItems)
        print("Produto adicionado ao carrinho: \(product.title). Total de itens: \(currentItems.count)")
    }
    
    func removeProduct(product: Product) {
        var currentItems = cartItemsSubject.value
        if let index = currentItems.firstIndex(where: { $0.id == product.id }) {
            currentItems.remove(at: index)
            cartItemsSubject.send(currentItems)
            print("Produto removido: \(product.title). Total de itens: \(currentItems.count)")
        }
    }
    
    func clearCart() {
        cartItemsSubject.send([])
        print("Carrinho limpo.")
    }
    
    var cartTotal: Double {
        return cartItemsSubject.value.reduce(0) { total, product in
            total + product.price
        }
    }
}
