//
//  CardView.swift
//  SimpleCardView
//
//  Created by Tomortec on 2022/4/23.
//  Copyright © 2022 Tomortec. All rights reserved.
//

import SwiftUI

public struct CardView<Cover: View, Detail: View>: View {
    let size: CGSize
    let title: String
    let proportion: CGFloat
    let spacing: CGFloat
    let titleFont: Font
    let backgroundColorTop: Color
    let backgroundColorBottom: Color
    let foregroundColor: Color
    let cover: Cover
    let detail: Detail
    let action: (() -> ())?
    
    @State var isShowingDetailsView = false
    
    public init(
        size: CGSize,
        title: String,
        proportion: CGFloat = 1 / 4,
        spacing: CGFloat = 0.0,
        titleFont: Font = .title3.bold(),
        backgroundColorTop: Color,
        backgroundColorBottom: Color,
        foregroundColor: Color = .white,
        @ViewBuilder cover: () -> Cover,
        @ViewBuilder detail: () -> Detail,
        action: (() -> ())? = nil
    ) {
        self.size = size
        self.title = title
        self.proportion = proportion
        self.spacing = spacing
        self.titleFont = titleFont
        self.backgroundColorTop = backgroundColorTop
        self.backgroundColorBottom = backgroundColorBottom
        self.foregroundColor = foregroundColor
        self.cover = cover()
        self.detail = detail()
        self.action = action
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: spacing) {
            Text(title)
                .font(titleFont)
                .frame(height: proportion * size.height)
            
            cover
                .frame(height: (1 - proportion) * size.height)
        }
        .frame(width: size.width, height: size.height)
        .foregroundColor(foregroundColor)
        .background(
            RoundedRectangle(cornerRadius: 12.0)
                .fill(LinearGradient(colors: [backgroundColorTop, backgroundColorBottom], startPoint: .top, endPoint: .bottom))
                .shadow(color: .gray, radius: 12.0, x: 0.0, y: 0.0)
        )
        .fullScreenCover(isPresented: $isShowingDetailsView) {
            CardDetailsView(flag: $isShowingDetailsView) {
                detail
            }
        }
        .onTapGesture {
            isShowingDetailsView = true
            action?()
        }
    }
}
