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
    
    func buildImageView() -> UIImageView {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.alpha = 0
        return iv
    }
    
    func buildLabel(font: UIFont.TextStyle = .headline, textColor: UIColor = .label, numberOfLines: Int = 1) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .preferredFont(forTextStyle: font)
        lbl.textColor = textColor
        lbl.numberOfLines = numberOfLines
        return lbl
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
