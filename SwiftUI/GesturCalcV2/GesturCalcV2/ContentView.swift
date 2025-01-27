//
//  ContentView.swift
//  GesturCalcV2
//
//  Created by David Sabzanov on 4/24/24.
//

import SwiftUI



struct ContentView: View {
    @State private var showHelpView = false
    @State private var operationLabel: String = ""
    @State private var numberLabel: String = "0"
    @StateObject var status = CalculatorStatus()
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 100) {
                HStack(spacing: 250) {
                    Button {
                        showHelpView.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.system(size: 40, weight: .light))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .sheet(isPresented: $showHelpView) {
                        HelpView()
                    }
                    Text(operationLabel)
                        .font(.custom("HelveticaLight", size: 40))
                        .foregroundStyle(Color.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 40.0)
                .background(Color.black)
                
                Text(numberLabel)
                    .font(.custom("HelveticaLight", size: 80))
                    .frame(maxWidth: .infinity, maxHeight: 150.0, alignment: .trailing)
                    .foregroundStyle(Color.white)
                    
            }
            .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                .onEnded { value in
                    displayGestures(value: value)
                }
            )
            .onTapGesture {
                functionButtons(selectedOperator: .sum)
            }
            .onLongPressGesture {
                functionButtons(selectedOperator: .reset)
            }
            
            
            NumPadView(status: status, numberLabel: $numberLabel)
                .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                    .onEnded { value in
                        numPadGestures(value: value)
                    }
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
    
    func reset() {
        operationLabel = ""
        numberLabel = "0"
        status.previousNumber = 0
        status.numberOnScreen = 0
        status.currentNumber = ""
        status.operation = .non
        status.prevOperation = .non
        status.performingMath = false
    }
    
    func displayGestures(value: DragGesture.Value) {
        print(value.translation)
        switch(value.translation.width, value.translation.height) {
            case (...0, -30...30), (0..., -30...30):
                print("left swipe")
                removeLastDigit()
            case (-100...100, ...0):
                print("up swipe")
                functionButtons(selectedOperator: .negation)
            case (-100...100, 0...):
                print("down swipe")
                functionButtons(selectedOperator: .percentage)
            default:  print("no clue")
        }
    }
    
    func numPadGestures(value: DragGesture.Value) {
        print(value.translation)
        switch(value.translation.width, value.translation.height) {
            case (...0, -30...30):
                print("left swipe")
                functionButtons(selectedOperator: .subtraction)
            case (0..., -30...30):
                print("right swipe")
                functionButtons(selectedOperator: .addition)
            case (-100...100, ...0):
                print("up swipe")
                functionButtons(selectedOperator: .multiplication)
            case (-100...100, 0...):
                print("down swipe")
                functionButtons(selectedOperator: .division)
            default:  print("no clue")
        }
    }
    
    func functionButtons(selectedOperator: Operator) {
        
        if (status.prevOperation == .sum) && selectedOperator == .percentage {
            guard let numOnScreen = Double(numberLabel.replacingOccurrences(of: ",", with: ""))
                else { return }
            status.numberOnScreen = numOnScreen
            status.performingMath = false
        }
        
        if selectedOperator != .reset && selectedOperator != .sum {
            if status.previousNumber != 0 && status.numberOnScreen != 0 && (selectedOperator != .sum || selectedOperator != .percentage) && status.opIsSet == true {
                // calculate()
            }
            
            if selectedOperator != .percentage && numberLabel != "" {
                guard let prevNumber = Double(numberLabel.replacingOccurrences(of: ",", with: ""))
                    else { return }
                status.previousNumber = prevNumber
                status.currentNumber = ""
            }
            
            if selectedOperator == .division {
                operationLabel = selectedOperator.rawValue
                status.operation = .division
                status.performingMath = true
                status.opIsSet = true
            }
            else if selectedOperator == .multiplication {
                operationLabel = selectedOperator.rawValue
                status.operation = .multiplication
                status.performingMath = true
                status.opIsSet = true
                
            }
            else if selectedOperator == .subtraction {
                operationLabel = selectedOperator.rawValue
                status.operation = .subtraction
                status.performingMath = true
                status.opIsSet = true
            }
            else if selectedOperator == .addition {
                operationLabel = selectedOperator.rawValue
                status.operation = .addition
                status.performingMath = true
                status.opIsSet = true
            }
            else if selectedOperator == .percentage {
                operationLabel = selectedOperator.rawValue
                
                if status.performingMath == true {
                    status.prevOperation = status.operation
                    status.operation = selectedOperator
                    // calculate()
                }
                else {
                    status.operation = selectedOperator
                    // calculate()
                }
            }
            else if selectedOperator == .negation {
                status.previousNumber = -status.previousNumber
                numberLabel = formatForNumberLabel(status.previousNumber)
            }
        }
        else if selectedOperator == .sum {
            if status.prevOperation != .sum {
                operationLabel = selectedOperator.rawValue
                // calculate()
                status.numberOnScreen = 0
                status.currentNumber = ""
                status.prevOperation = selectedOperator
            }
        }
        else if selectedOperator == .reset {
            reset()
        }
        status.prevOperation = selectedOperator
    }
    
    func removeLastDigit() {
        if (numberLabel.count) > 1 {
            if numberLabel == "." {
                numberLabel.removeLast()
            }
            else {
                numberLabel = numberLabel.replacingOccurrences(of: ",", with: "")
                numberLabel.removeLast()
                
                guard let numberLabelDouble = Double(numberLabel)
                    else { return }
                numberLabel = formatForNumberLabel(numberLabelDouble)
                
                guard let numberOnScreen = Double(numberLabel.replacingOccurrences(of: ",", with: ""))
                    else { return }
                status.numberOnScreen = numberOnScreen
                
                if status.performingMath == true {
                    status.currentNumber = String(status.currentNumber.dropLast())
                }

            }
        }
        else {
            status.numberOnScreen = 0
            numberLabel = formatForNumberLabel(status.numberOnScreen)
        }
    }
    
    func formatForNumberLabel(_ value: Double) -> String {
        var formattedNumber: String
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.usesSignificantDigits = false
        
        guard let NSLargeNumber: NSNumber = numberFormatter.number(from: "\(value)")
            else { return "Unable to format number: \(value)" }
        
        let largeNumber: String = String(describing: NSLargeNumber)
        
        if (largeNumber.contains(".")) {
            let valueSplitByDecimal: [String] = largeNumber.components(separatedBy: ".")
            
            let stringLeftHalf: String = valueSplitByDecimal[0]
            
            guard let intLeftHalf: Int = Int(stringLeftHalf)
                else { return "Unable to cast stringLeftHalf to Int" }
            guard let leftHalf = numberFormatter.string(from: NSNumber(value: intLeftHalf))
                else { return "Unable to format intLeftHalf"}
            
            var rightHalf = valueSplitByDecimal[1]
            
            while rightHalf.last == "0" {
                rightHalf.removeLast()
            }
            
            if (rightHalf.count) > 0 {
                formattedNumber = leftHalf + "." + rightHalf
            }
            else {
                formattedNumber = leftHalf
            }
        }
        else {
            guard let formattedNum = numberFormatter.string(from: NSNumber(value: value))
                else { return "Unable to format \(value)"}
            formattedNumber = formattedNum
        }
        
        return formattedNumber
    }
    
    func labelTextLengthLimiter() {
        let numberLabelLength = numberLabel.count

        if numberLabel.components(separatedBy: ",").count - 1 == 3 {
            if !numberLabel.contains(".") && numberLabelLength > 11 {
                removeLastDigit()
            }
        }
        else if numberLabel.components(separatedBy: ",").count - 1 == 2 {
            if numberLabel.contains(".") && numberLabelLength > 12 {
                removeLastDigit()
            }
            else if !numberLabel.contains(".") && numberLabelLength > 11 {
                removeLastDigit()
            }
            else if numberLabel.last == "." && numberLabelLength == 12 {
                removeLastDigit()
            }
        }
        else if numberLabel.components(separatedBy: ",").count - 1 == 1 {
            if numberLabelLength > 11 {
                removeLastDigit()
            }
        }
        else if numberLabel.components(separatedBy: ",").count - 1 == 0 {
            if numberLabelLength > 10 {
                removeLastDigit()
            }
        }
    }
}

class CalculatorStatus: ObservableObject {
    @Published var numberOnScreen: Double = 0
    @Published var previousNumber: Double = 0
    @Published var currentNumber: String = ""
    @Published var performingMath: Bool = false
    @Published var operation: Operator = .non
    @Published var prevOperation: Operator = .non
    @Published var opIsSet: Bool = false
}

enum Operator: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "×"
    case division = "÷"
    case negation
    case percentage = "%"
    case sum = "="
    case reset
    case non = ""
}



#Preview {
    ContentView()
}
