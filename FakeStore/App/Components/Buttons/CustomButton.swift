//
//  CustomButton.swift
//  FakeStore
//
//  Created by Diggo Silva on 22/07/25.
//

import UIKit

class CustomButton: UIButton {
    
    init(
        title: String? = nil,
        titleColor: UIColor? = .white,
        backgroundColor: UIColor? = .systemBlue,
        cornerRadius: CGFloat = 10,
        font: UIFont? = .preferredFont(forTextStyle: .body),
        isHidden: Bool = false,
        type: UIButton.ButtonType = .roundedRect
    ) {
        super.init(frame: .zero)
        setupButton(title: title, titleColor: titleColor, backgroundColor: backgroundColor, cornerRadius: cornerRadius, font: font)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupButton(title: String?, titleColor: UIColor?, backgroundColor: UIColor?, cornerRadius: CGFloat,font: UIFont?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.titleLabel?.font = font
    }
}
