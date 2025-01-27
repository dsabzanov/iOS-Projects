//
//  NumPadButtonView.swift
//  GesturCalcV2
//
//  Created by David Sabzanov on 4/28/24.
//

import SwiftUI

struct NumPadButtonView: View {
    @ObservedObject var status: CalculatorStatus
    @Binding var numberLabel: String
    var label: Value = .non
    
    
    var body: some View {
        Button(action: {
            numPadInput(value: label)
        }, label: {
            Text(label.rawValue)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.custom("HelveticaLight", size: 30))
                .foregroundStyle(Color.white)
                .background(Color.blue)
        })
    }
    
    func numPadInput(value: Value) {
        if value == .non {
            return
        }
//        numberLabel += value.rawValue
        
        if status.prevOperation == .sum {
            // reset
        }
        
        if value == .decimal && !numberLabel.contains(".") {
            numberLabel += value.rawValue
        }
        if numberLabel == "0" {
            numberLabel = ""
        }
        if status.performingMath == true {
            if value != .decimal {
                status.currentNumber += value.rawValue
                numberLabel = status.currentNumber
            }
            else {
                if numberLabel == "0" {
                    status.currentNumber = "0."
                }
                else {
                    if !status.currentNumber.contains(".") {
                        status.currentNumber += "."
                    }
                }
                numberLabel = status.currentNumber
            }
        }
        else {
            if value != .decimal {
                numberLabel += value.rawValue
            }
            status.opIsSet = false
            if let prevNum = Double(numberLabel.replacingOccurrences(of: ",", with: "")) {
                status.previousNumber = prevNum
            }
        }
        if !(numberLabel.contains(".") || (numberLabel.contains(".") && numberLabel.last == "0")) {
//            numberLabel = formatForLabel(status.numberOnScreen)
        }
    }
}



#Preview {
    NumPadButtonView(status: CalculatorStatus(), numberLabel: .constant("199.5"))
}
