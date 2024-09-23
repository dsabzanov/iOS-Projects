//
//  HelpView.swift
//  GesturCalcV2
//
//  Created by David Sabzanov on 4/28/24.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var helpViewModel = HelpViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            Button("Back") {
                dismiss()
            }.frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                .font(.system(size: 17))
                .padding([.leading, .top], 10)
            
            Text("Gestures")
                .font(.system(size: 28, weight: .semibold))
                .foregroundStyle(Color.white)
            
            
            List {
                Text("Number Pad Gestures")
                    .font(.system(size: 24))
                    .foregroundStyle(Color.white)
                    .padding([.bottom, .top], 10)
                    .background(Color.black.ignoresSafeArea())
                    .listRowBackground(Color.black)
                VStack(alignment: .leading) {
                    ForEach(helpViewModel.numPadGestures, id: \.self) { numPadGesture in
                        GestureListContentView(primaryImageResource: numPadGesture.primaryImage, description: numPadGesture.description, operation: numPadGesture.operation)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.ignoresSafeArea())
                .listRowBackground(Color.black)
                
                Text("Display Gestures")
                    .font(.system(size: 24))
                    .foregroundStyle(Color.white)
                    .padding([.bottom, .top], 10)
                    .background(Color.black.ignoresSafeArea())
                    .listRowBackground(Color.black)
                VStack(alignment: .leading) {
                    ForEach(helpViewModel.displayGestures, id: \.self) { displayGesture in
                        if displayGesture.secondaryImage == .swipeRightPng {
                            GestureListContentView(spacing: 28, primaryImageResource: displayGesture.primaryImage,secondaryImageResource: displayGesture.secondaryImage, description: displayGesture.description, operation: displayGesture.operation)
                        }
                        else {
                            GestureListContentView(primaryImageResource: displayGesture.primaryImage, description: displayGesture.description, operation: displayGesture.operation)
                        }
                    }
                    .listRowInsets(EdgeInsets())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.ignoresSafeArea())
                .listRowBackground(Color.black)
            }
            .scrollContentBackground(.visible)
            .listStyle(.plain)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
        
    }
}

