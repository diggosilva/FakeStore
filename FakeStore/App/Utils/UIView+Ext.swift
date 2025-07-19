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
    
    func buildStackView(arrangedSubviews: [UIView]) -> UIStackView {
        let sv = UIStackView(arrangedSubviews: arrangedSubviews)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 8
        sv.alpha = 0
        return sv
    }
}
