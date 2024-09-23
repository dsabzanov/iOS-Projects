//
//  GestureListContentView.swift
//  GesturCalcV2
//
//  Created by David Sabzanov on 6/10/24.
//

import SwiftUI

struct GestureListContentView: View {
    var spacing: CGFloat = 50
    var primaryImageResource: ImageResource = .tapPng
    var secondaryImageResource: ImageResource = .tapPng
    var description: String = "desc"
    var operation: String = "?"
    
    var body: some View {
        HStack(alignment: .center, spacing: spacing) {
            if (description == "Swipe Left/Right") {
                Text(description)
                    .font(.system(size: 18))
                    .foregroundStyle(Color.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
            }
            else {
                Text(description)
                    .font(.system(size: 18))
                    .foregroundStyle(Color.white)
                    .frame(width: 100)
                    .lineLimit(1)
            }
            
            Image(primaryImageResource)
                .resizable()
                .aspectRatio(nil, contentMode: .fit)
                .frame(width: 40, height: 40)
            
            if secondaryImageResource != .tapPng {
                Image(secondaryImageResource)
                    .resizable()
                    .aspectRatio(nil, contentMode: .fit)
                    .frame(width: 40, height: 40)
            }
            
            if (operation == "Delete/Undo") {
                Text(operation)
                    .font(.system(size: 18))
                    .foregroundStyle(Color.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
            }
            else {
                Text(operation)
                    .font(.system(size: 18))
                    .foregroundStyle(Color.white)
                    .frame(width: 50)
                    .lineLimit(1)
            }
        }
        .listRowBackground(Color.clear)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
    }
    
}

#Preview {
    GestureListContentView()
}
