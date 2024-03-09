//
//  LogoView.swift
//  Calculator
//
//  Created by Hina on 2024/03/06.
//

import UIKit

class LogoView: UIView {

    private let imageView: UIImageView = {
        let view = UIImageView(image: .init(named: "icCalculatorBW"))
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let topLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: "Mr TIP",
            attributes: [.font: ThemeFont.demibold(ofSize: 16)])
        //TIPだけ大文字
        text.addAttributes([.font: ThemeFont.bold(ofSize: 24)], range: NSMakeRange(3, 3))
        label.attributedText = text
        return label
    }()

    private var bottomLabel: UILabel = {
        LabelFactory.build(text: "Calculator",
                           font: ThemeFont.demibold(ofSize: 20),
                           textAligment:  .left)
    }()

    private lazy var vStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            topLabel,
            bottomLabel
        ])
        view.axis = .vertical
        view.spacing = -4
        return view
    }()

    private lazy var hStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            imageView,
            vStackView
        ])
        view.axis = .horizontal
        view.spacing = 8
        view.alignment = .center
        return view
    }()

    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(hStackView)
        hStackView.snp.makeConstraints { make in
            //親Viewの上端と下端と合わせる
            make.top.bottom.equalToSuperview()
            //親ViewのX軸上の中心と合わせる
            make.centerX.equalToSuperview()
        }

        imageView.snp.makeConstraints { make in
            //imageViewの高さと幅を同じにする
            make.height.equalTo(imageView.snp.width)
        }
    }
}
