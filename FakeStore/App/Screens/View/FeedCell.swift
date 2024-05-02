//
//  FeedCell.swift
//  FakeStore
//
//  Created by Diggo Silva on 02/05/24.
//

import UIKit

class FeedCell: UITableViewCell {
    static let identifier = "FeedCell"
    
    lazy var viewBG: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var imageProduct: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.fill")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .systemMint
        image.clipsToBounds =  true
        image.layer.cornerRadius = 10
        return image
    }()
    
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Título aqui do produto com uma descrição breve"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var labelCategory: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "men's clothing"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.font = .italicSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var imageRate: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "star.leadinghalf.filled")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFit
        image.clipsToBounds =  true
        return image
    }()
    
    lazy var labelRate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "3.8"
        label.textColor = .systemYellow
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Aqui vai a descrição do produto, informando tudo o que ele tem de bom, pontuando muito bem a sua qualidade."
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 3
        return label
    }()
    
    lazy var labelPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$123,45"
        label.textColor = .systemIndigo
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var buttonBuy: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Buy", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        contentView.addSubview(viewBG)
        viewBG.addSubview(imageProduct)
        viewBG.addSubview(labelTitle)
        viewBG.addSubview(labelCategory)
        viewBG.addSubview(imageRate)
        viewBG.addSubview(labelRate)
        viewBG.addSubview(labelDescription)
        viewBG.addSubview(labelPrice)
        viewBG.addSubview(buttonBuy)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            viewBG.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            viewBG.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewBG.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewBG.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            imageProduct.topAnchor.constraint(equalTo: viewBG.topAnchor, constant: 5),
            imageProduct.leadingAnchor.constraint(equalTo: viewBG.leadingAnchor, constant: 5),
            imageProduct.bottomAnchor.constraint(equalTo: viewBG.bottomAnchor, constant: -5),
            imageProduct.widthAnchor.constraint(equalToConstant: 150),
            imageProduct.heightAnchor.constraint(equalToConstant: 180),
            
            labelTitle.topAnchor.constraint(equalTo: imageProduct.topAnchor),
            labelTitle.leadingAnchor.constraint(equalTo: imageProduct.trailingAnchor, constant: 10),
            labelTitle.trailingAnchor.constraint(equalTo: viewBG.trailingAnchor, constant: -10),
            
            labelCategory.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 5),
            labelCategory.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor),
            
            imageRate.centerYAnchor.constraint(equalTo: labelCategory.centerYAnchor),
            imageRate.trailingAnchor.constraint(equalTo: labelRate.leadingAnchor, constant: -5),
            
            labelRate.centerYAnchor.constraint(equalTo: imageRate.centerYAnchor),
            labelRate.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor),
            
            labelDescription.topAnchor.constraint(equalTo: labelCategory.bottomAnchor, constant: 10),
            labelDescription.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor),
            labelDescription.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor),
            
            labelPrice.bottomAnchor.constraint(equalTo: imageProduct.bottomAnchor, constant: -10),
            labelPrice.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor),
            
            buttonBuy.centerYAnchor.constraint(equalTo: labelPrice.centerYAnchor),
            buttonBuy.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor),
            buttonBuy.widthAnchor.constraint(equalToConstant: 100),
            buttonBuy.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
