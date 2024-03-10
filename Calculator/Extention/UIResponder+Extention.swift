//
//  UIResponder+Extention.swift
//  Calculator
//
//  Created by Hina on 2024/03/09.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
