//
//  DetailsViewController.swift
//  FakeStore
//
//  Created by Diggo Silva on 21/07/25.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let detailsView = DetailsView()
    private let viewModel: DetailsViewModelProtocol
    
    init(viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
         super.loadView()
        view = detailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureDelegates()
        receivedProduct()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Detalhes do Produto"
    }
    
    private func configureDelegates() {
        detailsView.delegate = self
    }
    
    private func receivedProduct() {
        detailsView.configure(product: viewModel.product)
    }
}

extension DetailsViewController: DetailsViewDelegate {
    func didTapAddToCartButton() {
        viewModel.addProductToCart()
        showAddToCartConfirmation()
    }
    
    func showAddToCartConfirmation() {
        let alert = UIAlertController(title: "Produto Adicionado!", message: "\(viewModel.product.title)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
