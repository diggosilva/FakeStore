//
//  FeedCell.swift
//  FakeStore
//
//  Created by Diggo Silva on 02/05/24.
//

import UIKit
import SDWebImage

class FeedCell: UITableViewCell {
    
    static let identifier = "FeedCell"
    
    lazy var productImageView = buildImageView()
    lazy var titleLabel = buildLabel(numberOfLines: 2)
    lazy var descriptionLabel = buildLabel(font: .subheadline, textColor: .secondaryLabel, numberOfLines: 3)
    lazy var priceLabel = buildLabel(font: .body)
    
    lazy var VStack = buildStackView(arrangedSubviews: [titleLabel, descriptionLabel, priceLabel])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        addSubviews(productImageView, VStack)
    }
    
    private func setConstraints() {
        let padding: CGFloat = 16
        
        NSLayoutConstraint.activate([
            productImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            productImageView.widthAnchor.constraint(equalToConstant: 100),
            productImageView.heightAnchor.constraint(equalTo: productImageView.widthAnchor),
            
            VStack.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            VStack.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: padding),
            VStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            VStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
        ])
    }
    
    func configure(productFeed: ProductFeed) {
        animateCell(alpha: 0)
        guard let url = URL(string: productFeed.image) else { return }
        productImageView.sd_setImage(with: url)
        titleLabel.text = productFeed.title
        descriptionLabel.text = productFeed.description
        priceLabel.text = productFeed.priceFormatted
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.animateCell(alpha: 1)
        }
    }
    
    func animateCell(alpha: CGFloat) {
        UIView.animate(withDuration: 0.25, animations: {
            self.productImageView.alpha = alpha
            self.VStack.alpha = alpha
        })
    }
}
