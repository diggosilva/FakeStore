//
//  FeedViewController.swift
//  FakeStore
//
//  Created by Diggo Silva on 02/05/24.
//

import UIKit

class FeedViewController: UIViewController {
    
    let viewModel = FeedViewModel()
    let feedView = FeedView()
    
    override func loadView() {
        super.loadView()
        view = feedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        handleStates()
        viewModel.loadDataProducts()
    }
    
    private func setNavBar() {
        title = "PRODUTOS"
        view.backgroundColor = .systemBackground
    }
    
    func handleStates() {
        viewModel.state.bind { states in
            switch states {
            case .loading:
                return self.showLoadingState()
            case .loaded:
                return self.showLoadedState()
            case .error:
                return self.showErrorState()
            }
        }
    }
    
    func showLoadingState() {
        feedView.removeFromSuperview()
    }
    
    func showLoadedState() {
        feedView.spinner.stopAnimating()
        feedView.tableView.reloadData()
    }
    
    func showErrorState() {
        let alert = UIAlertController(title: "Ocorreu um erro!", message: "Tentar novamente?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Sim", style: .default) { action in
            print("Clicou no botão SIM")
        }
        let nok = UIAlertAction(title: "Não", style: .cancel) { action in
            print("Clicou no botão NÃO")
        }
        alert.addAction(ok)
        alert.addAction(nok)
        present(alert, animated: true)
    }
}
