//
//  SimpleExample.swift
//  SimpleCardView_Example
//
//  Created by Tomortec on 2022/4/23.
//  Copyright © 2022 Tomortec. All rights reserved.
//

import SwiftUI
import SimpleCardView_SwiftUI

struct SimpleExample: View {
    var body: some View {
        HStack(spacing: 20.0) {
            CardView(
                size: CGSize(width: 150.0, height: 200.0),
                title: "Hello World",
                cover: {
                    Image(systemName: "leaf.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 100.0, height: 100.0)
                }, detail: {
                    VStack(spacing: 20.0) {
                        Text("Sheet")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                        Image(systemName: "moon.stars.fill")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .foregroundColor(.yellow)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.cyan)
            })
            .backgroundColor(colors: [.cyan, .blue])
            
            CardView(
                size: CGSize(width: 150.0, height: 200.0),
                title: "Hello World",
                detailViewType: .fullScreen,
                cover: {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 100.0, height: 100.0)
                }, detail: {
                    VStack(spacing: 20.0) {
                        Text("Fullscreen")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .foregroundColor(.yellow)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.mint)
            })
            .backgroundColor(colors: [.pink, .red])
        }
    }
}

struct SimpleExample_Previews: PreviewProvider {
    static var previews: some View {
        SimpleExample()
    }
}
