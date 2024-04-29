//
//  NumPadButtonView.swift
//  GesturCalcV2
//
//  Created by David Sabzanov on 4/28/24.
//

import SwiftUI

struct NumPadButtonView: View {
    var label: String = "?"
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Text(label)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.custom("HelveticaLight", size: 30))
                .foregroundStyle(Color.white)
                .background(Color.blue)
        })
    }
}

#Preview {
    NumPadButtonView()
}
