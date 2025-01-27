//
//  NumPadView.swift
//  GesturCalcV2
//
//  Created by David Sabzanov on 4/29/24.
//

import SwiftUI

struct NumPadView: View {
    @ObservedObject var status: CalculatorStatus
    @Binding var numberLabel: String
    
    var body: some View {
        HStack(spacing: 0) {
            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .seven)
            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .eight)
            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .nine)
        }
        HStack(spacing: 0) {
            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .four)
            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .five)
            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .six)
        }
        HStack(spacing: 0) {
            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .one)
            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .two)
            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .three)
        }
        HStack(spacing: 0) {
            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .zero)
            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .decimal)
        }
    }
}

enum Value: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case decimal = "."
    case non = "?"
}

#Preview {
    NumPadView(status: CalculatorStatus(), numberLabel: .constant("199.4"))
}
