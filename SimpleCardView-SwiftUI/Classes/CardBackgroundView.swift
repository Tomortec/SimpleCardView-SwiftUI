//
//  CardBackgroundView.swift
//  SimpleCardView
//
//  Created by Tomortec on 2022/4/23.
//  Copyright © 2022 Tomortec. All rights reserved.
//

import SwiftUI

struct CardBackgroundView: View {
    
    var backgroundColor: Color = .blue
    var backgroundGradient: LinearGradient?
    
    var cornerRadius: CGFloat  = 12.0
    
    var shadowColor: Color = .gray
    var shadowRadius: CGFloat = 12.0
    var shadowXOffset: CGFloat = 0.0
    var shadowYOffset: CGFloat = 0.0
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(backgroundGradient ??
                  LinearGradient(colors: [backgroundColor], startPoint: .top, endPoint: .bottom))
            .shadow(color: shadowColor, radius: shadowRadius, x: shadowXOffset, y: shadowYOffset)
    }
}

/* MARK: - Property Modifiers */
extension CardBackgroundView {
    func backgroundColor(_ color: Color) -> Self {
        var copied = self
        copied.backgroundColor = color
        return copied
    }
    
    func backgroundColor(colors: [Color], startPoint: UnitPoint, endPoint: UnitPoint) -> Self {
        var copied = self
        copied.backgroundGradient = LinearGradient(colors: colors, startPoint: startPoint, endPoint: endPoint)
        return copied
    }
    
    func cardCornerRadius(_ radius: CGFloat) -> Self {
        var copied = self
        copied.cornerRadius = radius
        return copied
    }
    
    func cardShadow(radius: CGFloat, color: Color?, xOffset: CGFloat?, yOffset: CGFloat?) -> Self {
        var copied = self
        copied.shadowColor = color ?? self.shadowColor
        copied.shadowRadius = radius
        copied.shadowXOffset = xOffset ?? self.shadowXOffset
        copied.shadowYOffset = yOffset ?? self.shadowYOffset
        return copied
    }
}
