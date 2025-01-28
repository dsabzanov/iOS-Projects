//
//  NumPadButtonView.swift
//  GesturCalcV2
//
//  Created by David Sabzanov on 4/28/24.
//

import SwiftUI

struct NumPadButtonView: View {
//    @ObservedObject var status: CalculatorStatus
//    @Binding var numberLabel: String
    var label: Value = .non
    
//    var formatNumberLabel: (Double) -> String
    var numInput: (Value) -> Void
    
    var body: some View {
        Button(action: {
            numInput(label)
        }, label: {
            Text(label.rawValue)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.custom("HelveticaLight", size: 30))
                .foregroundStyle(Color.white)
                .background(Color.blue)
        })
    }
    
    
}



#Preview {
//    NumPadButtonView(status: CalculatorStatus(), numberLabel: .constant("199.5"), formatNumberLabel: <#(Double) -> String#>)
}
