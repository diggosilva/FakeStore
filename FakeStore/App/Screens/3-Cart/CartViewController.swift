//
//  CartViewController.swift
//  FakeStore
//
//  Created by Diggo Silva on 24/07/25.
//

import UIKit
import Combine

class CartViewController: UIViewController {
    
    private let cartView = CartView()
    private let viewModel: CartViewModelProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: CartViewModelProtocol = CartViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
        super.loadView()
        view = cartView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureDelegatesAndDataSources()
        bindViewModel()
        viewModel.loadCartItems()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Meu Carrinho"
    }
    
    private func configureDelegatesAndDataSources() {
        cartView.tableView.dataSource = self
        cartView.tableView.delegate = self
    }
    
    private func bindViewModel() {
        viewModel.cartItemsPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] items in
                self?.cartView.tableView.reloadData()
                self?.cartView.updateTotalPrice(total: self?.viewModel.cartTotal ?? 0.0)
                
                if items.isEmpty {
                    self?.cartView.showEmptyCartMessage()
                } else {
                    self?.cartView.hideEmptyCartMessage()
                }
            }.store(in: &cancellables)
    }
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // A ViewModel (via CartManager) agora é a fonte da verdade para os itens
        return viewModel.currentCartItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCell", for: indexPath)
        let product = viewModel.currentCartItems[indexPath.row]

        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(systemName: "photo")
        content.text = product.title
        content.secondaryText = "R$ \(String(format: "%.2f", product.price))"
        cell.contentConfiguration = content

        return cell
    }
}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.removeItem(at: indexPath.row)
        }
    }
}
