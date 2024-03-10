//
//  AmountView.swift
//  Calculator
//
//  Created by Hina on 2024/03/07.
//

import UIKit

//TotalBill+TotalTip
class AmountView: UIView {

    private let title: String
    private let textAlignment: NSTextAlignment

    private lazy var  titleLabel: UILabel = {
        LabelFactory.build(
            text: title,
            font: ThemeFont.regular(ofSize: 18),
            textColor: ThemeColor.text,
            textAligment: textAlignment
        )
    }()

    private lazy var amoumtLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = textAlignment
        label.textColor = ThemeColor.primary
        let text = NSMutableAttributedString(
            string: "$0",
            attributes: [
                .font: ThemeFont.bold(ofSize: 24)
            ])
        text.addAttributes([.font: ThemeFont.bold(ofSize: 16)
                           ], range: NSMakeRange(0, 1))
        label.attributedText = text
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            amoumtLabel
        ])
        stackView.axis = .vertical
        return stackView
    }()

    //カスタムイニシャライザ
    init(title: String, textAlignment: NSTextAlignment) {
        self.title = title
        self.textAlignment = textAlignment
        super.init(frame: .zero)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(amount: Double) {
        let text = NSMutableAttributedString(
            string: amount.currensyFormatted,
            attributes: [.font: ThemeFont.bold(ofSize: 24)])
        text.addAttributes(
            [.font: ThemeFont.bold(ofSize: 16)],
            range: NSMakeRange(0, 1))
        amoumtLabel.attributedText = text
    }
    private func layout() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
