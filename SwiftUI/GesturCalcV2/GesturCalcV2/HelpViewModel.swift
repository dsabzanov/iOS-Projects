//
//  HelpViewModel.swift
//  GesturCalcV2
//
//  Created by David Sabzanov on 6/10/24.
//

import Foundation

class HelpViewModel: ObservableObject {
    let numPadGestures = [
        Gesture(description: "Swipe Right", primaryImage: .swipeRightPng, operation: "+"),
        Gesture(description: "Swipe Left", primaryImage: .swipeLeftPng, operation: "-"),
        Gesture(description: "Swipe Up", primaryImage: .swipeUpPng, operation: "×"),
        Gesture(description: "Swipe Down", primaryImage: .swipeDownPng, operation: "÷"),
    ]
    
    let displayGestures = [
        Gesture(description: "Tap", primaryImage: .tapPng, operation: "="),
        Gesture(description: "Tap & Hold", primaryImage: .tapAndHoldPng, operation: "Clear"),
        Gesture(description: "Swipe Left/Right", primaryImage: .swipeLeftPng, secondaryImage: .swipeRightPng, operation: "Delete/Undo"),
        Gesture(description: "Swipe Up", primaryImage: .swipeUpPng, operation: "+/-"),
        Gesture(description: "Swipe Down", primaryImage: .swipeDownPng, operation: "%")
    ]
}


