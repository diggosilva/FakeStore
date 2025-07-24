//
//  FeedView.swift
//  FakeStore
//
//  Created by Diggo Silva on 02/05/24.
//

import UIKit

protocol FeedViewDelegate: AnyObject {
    func segmentedChanged()
}

class FeedView: UIView {
    
    lazy var segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["All", "Men", "Women", "Electro", "Jewelery"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.selectedSegmentIndex = UISegmentedControl.noSegment
        sc.addTarget(self, action: #selector(segmentedChanged), for: .valueChanged)
        return sc
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(FeedCell.self, forCellReuseIdentifier: FeedCell.identifier)
        table.backgroundColor = .secondarySystemBackground
        return table
    }()
    
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    lazy var labelError = CustomLabel(text: "Tente novamente mais tarde!", isHidden: true)
    
    weak var delegate: FeedViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    @objc func segmentedChanged() {
        delegate?.segmentedChanged()
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubviews(segmentedControl, tableView, spinner, labelError)
        backgroundColor = .systemBackground
    }
    
    private func setConstraints() {
        let padding: CGFloat = 16
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: padding / 2),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            labelError.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelError.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
