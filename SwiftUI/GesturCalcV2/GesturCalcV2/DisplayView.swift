//
//  DisplayView.swift
//  GesturCalcV2
//
//  Created by David Sabzanov on 1/26/25.
//

import SwiftUI

struct DisplayView: View {
    @State private var showHelpView = false
    var operationLabel = "0"
    var numberLabel = "0"
    
    
    var body: some View {
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
        
    }
}

#Preview {
    DisplayView()
}
