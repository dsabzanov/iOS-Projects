//
//  NumPadView.swift
//  GesturCalcV2
//
//  Created by David Sabzanov on 4/29/24.
//

import SwiftUI


struct NumPadView: View {
//    @StateObject var status: CalculatorStatus
//    @Binding var numberLabel: String
    
//    var formatNumberLabel: (Double) -> String
    var numPadInput: (Value) -> Void
    
    var body: some View {
        HStack(spacing: 0) {
//            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .seven, formatNumberLabel: formatNumberLabel)
//            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .eight, formatNumberLabel: formatNumberLabel)
//            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .nine, formatNumberLabel: formatNumberLabel)
            NumPadButtonView(label: .seven, numInput: numPadInput)
            NumPadButtonView(label: .eight, numInput: numPadInput)
            NumPadButtonView(label: .nine, numInput: numPadInput)
        }
        HStack(spacing: 0) {
//            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .four, formatNumberLabel: formatNumberLabel)
//            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .five, formatNumberLabel: formatNumberLabel)
//            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .six, formatNumberLabel: formatNumberLabel)
            NumPadButtonView(label: .four, numInput: numPadInput)
            NumPadButtonView(label: .five, numInput: numPadInput)
            NumPadButtonView(label: .six, numInput: numPadInput)
        }
        HStack(spacing: 0) {
//            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .one, formatNumberLabel: formatNumberLabel)
//            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .two, formatNumberLabel: formatNumberLabel)
//            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .three, formatNumberLabel: formatNumberLabel)
            NumPadButtonView(label: .one, numInput: numPadInput)
            NumPadButtonView(label: .two, numInput: numPadInput)
            NumPadButtonView(label: .three, numInput: numPadInput)
        }
        HStack(spacing: 0) {
//            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .zero, formatNumberLabel: formatNumberLabel)
//            NumPadButtonView(status: status, numberLabel: $numberLabel, label: .decimal, formatNumberLabel: formatNumberLabel)
            NumPadButtonView(label: .zero, numInput: numPadInput)
            NumPadButtonView(label: .decimal, numInput: numPadInput)
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
//    NumPadView(status: CalculatorStatus(), numberLabel: .constant("199.4"), formatNumberLabel: <#(Double) -> String#>)
}
