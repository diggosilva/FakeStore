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
    var state: Bindable<FeedViewControllerStates> = Bindable(value: .loading)
    
    var newLabel = ""
    
    func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.newLabel = "Carregado!!!"
            self.state.value = .loaded
        }
    }
}
