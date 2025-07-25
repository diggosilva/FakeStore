//
//  CartView.swift
//  FakeStore
//
//  Created by Diggo Silva on 24/07/25.
//

import UIKit

class CartView: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CartItemCell")
        return tableView
    }()
    
    lazy var totalLabel = CustomLabel(text: "Total: R$ 0,00", style: .title, textAlignment: .right)
    lazy var emptyCartMessageLabel = CustomLabel(text: "Seu carrinho está vazio!", style: .custom(font: .systemFont(ofSize: 18, weight: .medium), textColor: .systemGray), textAlignment: .center, isHidden: true)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        setHierarchy()
        setConstraints()
        backgroundColor = .systemBackground
    }

    private func setHierarchy() {
        addSubviews(tableView, totalLabel, emptyCartMessageLabel)
    }

    private func setConstraints() {
        let padding: CGFloat = 16
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: totalLabel.topAnchor, constant: -padding),
            
            totalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            totalLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            totalLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            totalLabel.heightAnchor.constraint(equalToConstant: 40),
            
            emptyCartMessageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptyCartMessageLabel.centerYAnchor.constraint(equalTo: tableView.centerYAnchor),
            emptyCartMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            emptyCartMessageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
        ])
    }

    func updateTotalPrice(total: Double) {
        totalLabel.text = "Total: R$ \(String(format: "%.2f", total))"
    }
    
    func showEmptyCartMessage() {
           emptyCartMessageLabel.isHidden = false
           tableView.isHidden = true
           totalLabel.isHidden = true
       }

       func hideEmptyCartMessage() {
           emptyCartMessageLabel.isHidden = true
           tableView.isHidden = false
           totalLabel.isHidden = false 
       }
}
