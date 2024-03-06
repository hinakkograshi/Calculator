//
//  ThemeFont.swift
//  Calculator
//
//  Created by Hina on 2024/03/07.
//

import UIKit

struct ThemeFont {
    static func regular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir Next Regular", size: size) ?? .systemFont(ofSize: size)
    }

    static func bold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir Next Bold", size: size) ?? .systemFont(ofSize: size)
    }

    static func demibold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir Next Demi Bold", size: size) ?? .systemFont(ofSize: size)
    }
}
