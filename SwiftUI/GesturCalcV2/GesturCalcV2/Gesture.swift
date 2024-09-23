//
//  Gestures.swift
//  GesturCalcV2
//
//  Created by David Sabzanov on 6/10/24.
//

import Foundation
import SwiftUI

struct Gesture: Hashable {
    let description: String
    let primaryImage: ImageResource
    let secondaryImage: ImageResource
    let operation: String
    
    init(description: String, primaryImage: ImageResource, secondaryImage: ImageResource = .tapPng, operation: String) {
        self.description = description
        self.primaryImage = primaryImage
        self.secondaryImage = secondaryImage
        self.operation = operation
    }
}
