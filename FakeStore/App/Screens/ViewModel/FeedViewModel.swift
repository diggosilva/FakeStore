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
    
    private var sectionList: [Section] = []
    
    func numbersOfSection() -> Int {
        sectionList.count
    }
    
    func numberOfRowsInSection( numberOfRowsInSection section: Int) -> Int {
        return sectionList[section].list.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> ProductFeed {
        let section = sectionList[indexPath.section]
        let product = section.list[indexPath.row]
        return product
    }
    
    func tableView(titleForHeaderInSection section: Int) -> String? {
        return "\(sectionList[section].nome.capitalized)"
    }
    
    func loadDataProducts() {
        service.getProducts { produtos in
            let electronics = produtos.filter({ $0.category == CategoryProduct.electronics.rawValue })
            let jewelery = produtos.filter({ $0.category == CategoryProduct.jewelery.rawValue })
            let menSClothing = produtos.filter({ $0.category == CategoryProduct.menSClothing.rawValue })
            let womenSClothing = produtos.filter({ $0.category == CategoryProduct.womenSClothing.rawValue })
            
            let sectionElectronics = Section(nome: CategoryProduct.electronics.rawValue, list: electronics)
            let sectionJewelery = Section(nome: CategoryProduct.jewelery.rawValue, list: jewelery)
            let sectionMenSClothing = Section(nome: CategoryProduct.menSClothing.rawValue, list: menSClothing)
            let sectionWomenSClothing = Section(nome: CategoryProduct.womenSClothing.rawValue, list: womenSClothing)
            
            self.sectionList.append(contentsOf: [sectionElectronics, sectionJewelery, sectionMenSClothing, sectionWomenSClothing])
            
            self.state.value = .loaded
        } onError: { error in
            self.state.value = .error
        }
    }
}
