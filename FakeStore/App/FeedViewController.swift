//
//  FeedViewController.swift
//  FakeStore
//
//  Created by Diggo Silva on 02/05/24.
//

import UIKit

class FeedViewController: UIViewController {
    
    let labelCarregando: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Carregando..."
        label.textColor = .systemRed
        return label
    }()
    
    let viewModel = FeedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(labelCarregando)
        
        NSLayoutConstraint.activate([
            labelCarregando.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelCarregando.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        handleStates()
        viewModel.loadData()
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
        
    }
    
    func showLoadedState() {
        view.backgroundColor = .systemBackground
        labelCarregando.text = viewModel.newLabel
        labelCarregando.textColor = .systemGreen
    }
    
    func showErrorState() {
        
    }
    
}
