//
//  CardTitleView.swift
//  SimpleCardView
//
//  Created by Tomortec on 2022/4/23.
//  Copyright © 2022 Tomortec. All rights reserved.
//

import SwiftUI

struct CardTitleView: View {
    var title: String?
    var titleFont: Font = .title3.bold()
    var titleColor: Color = .white
    var titleAlignment: Alignment = .center
    var titleTruncationMode: Text.TruncationMode = .tail
    
    var alternativeView: AnyView = AnyView(EmptyView())
    
    var body: some View {
        if let title = title {
            Text(title)
                .font(titleFont)
                .truncationMode(titleTruncationMode)
                .foregroundColor(titleColor)
                .frame(maxWidth: .infinity, alignment: titleAlignment)
                .padding()
        } else {
            alternativeView
        }
    }
}

/* MARK: - Property Modifiers */
extension CardTitleView {
    func replaceTitleView(with alternativeView: AnyView) -> Self {
        var copied = self
        copied.title = nil
        copied.alternativeView = alternativeView
        return copied
    }
    
    func title(_ title: String) -> Self {
        var copied = self
        copied.title = title
        return copied
    }
    
    func titleFont(_ font: Font) -> Self {
        var copied = self
        copied.titleFont = font
        return copied
    }
    
    func titleColor(_ color: Color) -> Self {
        var copied = self
        copied.titleColor = color
        return copied
    }
    
    func titleAlignment(_ alignment: Alignment) -> Self {
        var copied = self
        copied.titleAlignment = alignment
        return copied
    }
    
    func titleTruncationMode(_ mode: Text.TruncationMode) -> Self {
        var copied = self
        copied.titleTruncationMode = mode
        return copied
    }
}
