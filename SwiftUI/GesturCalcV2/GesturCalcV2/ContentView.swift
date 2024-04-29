//
//  ContentView.swift
//  GesturCalcV2
//
//  Created by David Sabzanov on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 100) {
                HStack(spacing: 250) {
                    NavigationView {
                        NavigationLink {
                            HelpView()
                        } label: {
                            Image(systemName: "info.circle")
                                .font(.system(size: 40, weight: .light))
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .background(Color.black)
                        
                    }
                    Text("+")
                        .font(.custom("HelveticaLight", size: 40))
                        .foregroundStyle(Color.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 40.0)
                .background(Color.black)
                
                Text("0")
                    .font(.custom("HelveticaLight", size: 80))
                    .frame(maxWidth: .infinity, maxHeight: 150.0, alignment: .trailing)
                    .foregroundStyle(Color.white)
            }
            
            
            
            
            HStack(spacing: 0) {
                NumPadButtonView()
                NumPadButtonView()
                NumPadButtonView()
            }
            HStack(spacing: 0) {
                NumPadButtonView()
                NumPadButtonView()
                NumPadButtonView()
            }
            HStack(spacing: 0) {
                NumPadButtonView()
                NumPadButtonView()
                NumPadButtonView()
            }
            HStack(spacing: 0) {
                NumPadButtonView()
                NumPadButtonView()
            }
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
}

#Preview {
    ContentView()
}
