//
//  FeedViewController.swift
//  FakeStore
//
//  Created by Diggo Silva on 02/05/24.
//

import UIKit
import Combine

class FeedViewController: UIViewController {
    
    private let feedView = FeedView()
    private let viewModel = FeedViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func loadView() {
        super.loadView()
        view = feedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegatesAndDataSources()
        handleStates()
        viewModel.loadDataProducts()
    }
    
    private func setNavBar() {
        navigationItem.title = "PRODUTOS"
    }
    
    private func setDelegatesAndDataSources() {
        feedView.tableView.delegate = self
        feedView.tableView.dataSource = self
    }
    
    private func handleStates() {
        viewModel.statePublisher
            .receive(on: RunLoop.main)
            .sink { states in
                switch states {
                case .loading: self.showLoadingState()
                case .loaded: self.showLoadedState()
                case .error: self.showErrorState()
                }
            }.store(in: &cancellables)
    }
    
    private func showLoadingState() {
        feedView.spinner.startAnimating()
    }
    
    private func showLoadedState() {
        feedView.spinner.stopAnimating()
        feedView.tableView.reloadData()
    }
    
    private func showErrorState() {
        let alert = UIAlertController(title: "Ocorreu um erro!", message: "Tentar novamente?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Sim", style: .default) { action in
            self.feedView.spinner.startAnimating()
            self.viewModel.loadDataProducts()
        }
        let nok = UIAlertAction(title: "Não", style: .cancel) { action in
            self.feedView.tableView.isHidden = true
            self.feedView.spinner.stopAnimating()
            self.feedView.labelError.isHidden = false
        }
        alert.addAction(ok)
        alert.addAction(nok)
        present(alert, animated: true)
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numbersOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.identifier, for: indexPath) as? FeedCell else { return UITableViewCell() }
        cell.configure(productFeed: viewModel.cellForRowAt(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.tableView(titleForHeaderInSection: section)
    }
}
