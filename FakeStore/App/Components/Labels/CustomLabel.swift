//
//  CustomLabel.swift
//  FakeStore
//
//  Created by Diggo Silva on 18/07/25.
//

import UIKit

final class CustomLabel: UILabel {
    
    enum Style {
        case title
        case subtitle
        case price
        case error
        case custom(font: UIFont, textColor: UIColor)
    }
    
    init(
        text: String? = nil,
        style: Style = .price,
        numberOfLines: Int = 1,
        textAlignment: NSTextAlignment = .natural,
        isHidden: Bool = false
    ) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.isHidden = isHidden
        
        applyStyle(style)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func applyStyle(_ style: Style) {
        switch style {
        case .title:
            self.font = .preferredFont(forTextStyle: .headline)
            self.numberOfLines = 2
            
        case .subtitle:
            self.font = .preferredFont(forTextStyle: .subheadline)
            self.numberOfLines = 3
            self.textColor = .secondaryLabel
            
        case .price:
            self.font = .preferredFont(forTextStyle: .body)
            
        case .error:
            self.font = .preferredFont(forTextStyle: .callout)
            self.numberOfLines = 0
            
        case .custom(let font, let textColor):
            self.font = font
            self.textColor = textColor
        }
    }
}
