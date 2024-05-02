//
//  FeedViewModel.swift
//  FakeStore
//
//  Created by Diggo Silva on 02/05/24.
//

import Foundation

enum FeedViewControllerStates {
    case loading
    case loaded
    case error
}

class FeedViewModel {
    private (set) var state: Bindable<FeedViewControllerStates> = Bindable(value: .loading)
    
    private let service = Service()
    
    var produtosList: [ProductFeed] = []
    
    func loadDataProducts() {
        service.getProduct { produtos in
            self.produtosList.append(contentsOf: produtos)
            self.state.value = .loaded
        } onError: { error in
            print("ERRRROOOOOUUUU")
            self.state.value = .error
        }
    }
}
