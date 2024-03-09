//
//  UIView+Extension.swift
//  Calculator
//
//  Created by Hina on 2024/03/07.
//

import UIKit

extension UIView {
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.cornerRadius = radius
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor = backgroundCGColor
    }

    func addCornerRadius(radius:CGFloat) {
        layer.masksToBounds = false
        layer.cornerRadius = radius
    }
}
