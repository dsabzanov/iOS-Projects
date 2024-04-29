//
//  NumPadView.swift
//  GesturCalcV2
//
//  Created by David Sabzanov on 4/29/24.
//

import SwiftUI

struct NumPadView: View {
    var body: some View {
        HStack(spacing: 0) {
            NumPadButtonView(label: "7")
            NumPadButtonView(label: "8")
            NumPadButtonView(label: "9")
        }
        HStack(spacing: 0) {
            NumPadButtonView(label: "4")
            NumPadButtonView(label: "5")
            NumPadButtonView(label: "6")
        }
        HStack(spacing: 0) {
            NumPadButtonView(label: "1")
            NumPadButtonView(label: "2")
            NumPadButtonView(label: "3")
        }
        HStack(spacing: 0) {
            NumPadButtonView(label: "0")
            NumPadButtonView(label: ".")
        }
    }
}

#Preview {
    NumPadView()
}
