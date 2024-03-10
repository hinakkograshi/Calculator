//
//  Double+Extension.swift
//  Calculator
//
//  Created by Hina on 2024/03/10.
//

import Foundation

extension Double {
    var currensyFormatted: String {
        var isWholeNumber: Bool {
            isZero ? true: !isNormal ? false: self == rounded()
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = isWholeNumber ? 0 : 2
        return formatter.string(for: self) ?? ""
    }
}
