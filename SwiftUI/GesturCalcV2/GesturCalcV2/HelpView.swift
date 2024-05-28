//
//  HelpView.swift
//  GesturCalcV2
//
//  Created by David Sabzanov on 4/28/24.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Help View!")
        
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    HelpView()
}
