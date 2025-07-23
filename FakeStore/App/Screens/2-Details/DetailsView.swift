//
//  DetailsView.swift
//  FakeStore
//
//  Created by Diggo Silva on 21/07/25.
//

import UIKit
import SDWebImage

protocol DetailsViewDelegate: AnyObject {
    func didTapAddToCartButton()
}

class DetailsView: UIView {
    
    private lazy var productImageView = CustomImageView()
    private lazy var titleLabel = CustomLabel(style: .detailsTitle, textAlignment: .center)
    private lazy var descriptionLabel = CustomLabel(style: .detailsSubtitle, textAlignment: .justified)
    private lazy var priceLabel = CustomLabel(style: .price, textAlignment: .left)
    
    private lazy var ratingImage = CustomImageView()
    private lazy var ratingValueLabel = CustomLabel(style: .price, textAlignment: .right)
    private lazy var HStackRating = buildStackView(arrangedSubviews: [ratingImage, ratingValueLabel], axis: .horizontal, alpha: 1)
    
    private lazy var addToCartButton = CustomButton(title: "Adicionar ao Carrinho")
    
    weak var delegate: DetailsViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addToCartButton.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    @objc func addToCartButtonTapped() {
        delegate?.didTapAddToCartButton()
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubviews(productImageView, titleLabel, descriptionLabel, priceLabel, HStackRating, addToCartButton)
        backgroundColor = .systemBackground
    }
    
    private func setConstraints() {
        let padding: CGFloat = 16
        NSLayoutConstraint.activate([
            productImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            productImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: 200),
            productImageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: padding),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            
            HStackRating.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: padding),
            HStackRating.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            
            addToCartButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: padding * 2),
            addToCartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            addToCartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            addToCartButton.heightAnchor.constraint(equalToConstant: 50),
            addToCartButton.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }
    
    func configure(product: Product) {
        guard let url = URL(string: product.image) else { return }
        
        productImageView.sd_setImage(with: url)
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        priceLabel.text = "$\(String(format: "%.2f", product.price))"
        ratingValueLabel.text = "\(product.rating) / 5"
        
        if product.rating <= 1.66 {
            ratingImage.image = SFSymbols.star
        } else if product.rating <= 3.33 {
            ratingImage.image = SFSymbols.starHalf
        } else {
            ratingImage.image = SFSymbols.starFull
        }
    }
}
