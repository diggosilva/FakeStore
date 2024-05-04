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
    
    var sectionList: [[ProductFeed]] = []
    var categoryList: [String] = ["electronics", "jewelery", "men's clothing", "women's clothing"]
    
    func numbersOfSection() -> Int {
        sectionList.count
    }
    
    func numberOfRows( numberOfRowsInSection section: Int) -> Int {
        return sectionList[section].count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> ProductFeed {
        return sectionList[indexPath.section][indexPath.row]
    }
    
    func tableView(titleForHeaderInSection section: Int) -> String? {
        return "\(categoryList[section].capitalized)"
    }
    
    func loadDataProducts() {
        service.getProducts { produtos in
            let electronics = produtos.filter({ $0.category == "electronics" })
            let jewelery = produtos.filter({ $0.category == "jewelery" })
            let menSClothing = produtos.filter({ $0.category == "men's clothing" })
            let womenSClothing = produtos.filter({ $0.category == "women's clothing" })
            
            self.sectionList.append(contentsOf: [electronics, jewelery, menSClothing, womenSClothing])
            
            self.state.value = .loaded
        } onError: { error in
            self.state.value = .error
        }
    }
}
