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
        navigationItem.title = "Detalhes do Produto"
        receivedProduct()
    }
    
    private func receivedProduct() {
        detailsView.configure(product: viewModel.product)
    }
}
