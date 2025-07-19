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
    func numbersOfSection() -> Int
    func numberOfRowsInSection( numberOfRowsInSection section: Int) -> Int
    func cellForRowAt(indexPath: IndexPath) -> Product
    func tableView(titleForHeaderInSection section: Int) -> String?
    func loadDataProducts()
}

class FeedViewModel: FeedViewModelProtocol {
    
    private let service = Service()
    private var sectionList: [Section] = []
    
    @Published private var state: FeedViewControllerStates = .loading
    
    var statePublisher: AnyPublisher<FeedViewControllerStates, Never> {
        $state.eraseToAnyPublisher()
    }
    
    func numbersOfSection() -> Int {
        sectionList.count
    }
    
    func numberOfRowsInSection( numberOfRowsInSection section: Int) -> Int {
        return sectionList[section].list.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Product {
        let section = sectionList[indexPath.section]
        let product = section.list[indexPath.row]
        return product
    }
    
    func tableView(titleForHeaderInSection section: Int) -> String? {
        return "\(sectionList[section].categoryProduct)".capitalized
    }
    
    func loadDataProducts() {
        service.getProducts { produtos in
            let sectionElectronics = Section(categoryProduct: .electronics, list: produtos)
            let sectionJewelery = Section(categoryProduct: .jewelery, list: produtos)
            let sectionMenSClothing = Section(categoryProduct: .menSClothing, list: produtos)
            let sectionWomenSClothing = Section(categoryProduct: .womenSClothing, list: produtos)
            
            self.sectionList.append(contentsOf: [sectionElectronics, sectionJewelery, sectionMenSClothing, sectionWomenSClothing])
            self.state = .loaded
        } onError: { error in
            self.state = .error
        }
    }
}
