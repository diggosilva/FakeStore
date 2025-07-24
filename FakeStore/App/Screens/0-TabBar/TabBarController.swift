//
//  TabBarController.swift
//  FakeStore
//
//  Created by Diggo Silva on 24/07/25.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
    }
    
    private func configTabBar() {
        let feedVC = UINavigationController(rootViewController: FeedViewController())
        feedVC.tabBarItem.image = SFSymbols.house
        feedVC.tabBarItem.selectedImage = SFSymbols.houseFill
        feedVC.tabBarItem.title = "Produtos"
        
        let cartVC = UINavigationController(rootViewController: CartViewController())
        cartVC.tabBarItem.image = SFSymbols.cart
        cartVC.tabBarItem.selectedImage = SFSymbols.cartFill
        cartVC.tabBarItem.title = "Carrinho"
        
        UITabBar.appearance().tintColor = .label
        UITabBar.appearance().isTranslucent = false
        
        setViewControllers( [feedVC, cartVC], animated: true)
    }
}

class CartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Seu Carrinho"
        view.backgroundColor = .yellow
    }
    
    private func configureDelegatesAndDataSources() {
        
    }
}
