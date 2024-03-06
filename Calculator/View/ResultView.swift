//
//  ResultView.swift
//  Calculator
//
//  Created by Hina on 2024/03/06.
//

import UIKit

class ResultView: UIView {

    init() {
        super.init(frame: .zero)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        backgroundColor = .red
    }

}
