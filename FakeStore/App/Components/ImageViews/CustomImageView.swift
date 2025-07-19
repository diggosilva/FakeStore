//
//  CustomImageView.swift
//  FakeStore
//
//  Created by Diggo Silva on 18/07/25.
//

import UIKit

final class CustomImageView: UIImageView {
    
    init(
        cornerRadius: CGFloat = 8,
        contentMode: UIView.ContentMode = .scaleAspectFit,
        clipsToBounds: Bool = true,
        hasBorder: Bool = false,
        borderColor: UIColor = .lightGray,
        borderWidth: CGFloat = 1
    ) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = cornerRadius
        self.contentMode = contentMode
        self.clipsToBounds = clipsToBounds
        
        if hasBorder {
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = borderWidth
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
