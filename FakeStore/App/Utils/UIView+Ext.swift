//
//  UIView+Ext.swift
//  FakeStore
//
//  Created by Diggo Silva on 15/07/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    func buildStackView(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis = .vertical, alpha: CGFloat = 0) -> UIStackView {
        let sv = UIStackView(arrangedSubviews: arrangedSubviews)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = axis
        sv.alpha = alpha
        sv.spacing = 8
        return sv
    }
}
