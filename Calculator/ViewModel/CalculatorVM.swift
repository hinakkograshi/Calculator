//
//  CalculatorVM.swift
//  Calculator
//
//  Created by Hina on 2024/03/09.
//

import Foundation
import Combine

class CalculatorVM {

    struct Input {
        //Enter $
        let billPublisher: AnyPublisher<Double, Never>
        //Chose tip
        let tipPublisher: AnyPublisher<Tip, Never>
        //Split
        let splitPublisher: AnyPublisher<Int, Never>
    }

    //ResultViewに反映
    struct Output {
        let updateViewPublisher: AnyPublisher<Result, Never>
    }

    private var cancellables = Set<AnyCancellable>()
    func transform(input: Input) -> Output {
        let updateViewPublisher = Publishers.CombineLatest3(
            input.billPublisher,
            input.tipPublisher,
            input.splitPublisher).flatMap { [unowned self] (bill, tip, split) in
                let totalTip = getTipAmount(bill: bill, tip: tip)
                let totalBill = bill + totalTip
                let amountPerPerson = totalBill / Double(split)
                let result = Result(
                    amountPerPerson: amountPerPerson,
                    totalBill: totalBill,
                    totalTop: totalTip)
                return Just(result)
            }.eraseToAnyPublisher()

        return Output(updateViewPublisher: updateViewPublisher)
    }

    private func getTipAmount(bill: Double, tip: Tip) -> Double {
        switch tip {
        case .none:
            return 0
        case .tenPercent:
            return bill * 0.1
        case .fifteenPercent:
            return bill * 0.15
        case .twentyPercent:
            return bill * 0.2
        case .custom(let value):
            return Double(value)
        }
    }

}
