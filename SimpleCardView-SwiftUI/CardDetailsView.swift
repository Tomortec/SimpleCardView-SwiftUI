//
//  CardDetailsView.swift
//  SimpleCardView
//
//  Created by Tomortec on 2022/4/23.
//  Copyright © 2022 Tomortec. All rights reserved.
//

import SwiftUI

struct CardDetailsView<V: View>: View {
    let content: V
    
    @Binding var isShowingDetailsView: Bool
    
    @State var xOffset = 0.0
    @State var yOffset = 0.0
    
    init(flag isShowingDetailsView: Binding<Bool>, @ViewBuilder _ content: () -> V) {
        self.content = content()
        self._isShowingDetailsView = isShowingDetailsView
    }
    
    var body: some View {
        ZStack {
            content
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .offset(x: xOffset, y: yOffset)
        .gesture(DragGesture(minimumDistance: 50.0, coordinateSpace: .global).onChanged({
            // 0.01 is a factor preventing strong effect
            //
            // For this version, the `.fullScreenCover` only supports entering from bottom,
            // therefore, for consistency, the view may have to react to vertical actions
            yOffset += $0.translation.height * 0.01
        }).onEnded {
            if $0.translation.height > 100.0 {
                // dismiss
                isShowingDetailsView = false
            }
            
            // reset yOffset to prevent hanging it in the air
            //
            // use Timer to prevent shaking
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in self.yOffset = 0.0 }
        })
    }
}
