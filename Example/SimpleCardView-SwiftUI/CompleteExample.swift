//
//  CompleteExample.swift
//  SimpleCardView_Example
//
//  Created by Tomortec on 2022/4/23.
//  Copyright © 2022 Tomortec. All rights reserved.
//

import SwiftUI
import SimpleCardView_SwiftUI

struct CompleteExample: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HStack(spacing: 20.0) {
                // keep it simple
                CardView(
                    size: CGSize(width: 150.0, height: 200.0),
                    title: "Hello world",
                    cover: {
                        VStack(alignment: .center, spacing: 10.0) {
                            Image(systemName: "leaf.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 90.0, height: 90.0)
                            
                            Text("😉😉😉")
                                .foregroundColor(.white)
                        }
                    },
                    detail: {
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .foregroundColor(.yellow)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.blue)
                    })
                
                // customize constraints and onTapAction
                CardView(
                    size: CGSize(width: 150.0, height: 200.0),
                    title: "Constraints",
                    titleViewProportion: 1 / 3, // the title view takes up 1 / 3 's place and the cover takes up 2 / 3
                    spacing: 0.0,
                    detailViewType: .sheet,
                    cover: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 100.0, height: 100.0)
                    },
                    detail: {
                        Image(systemName: "moon.stars.fill")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .foregroundColor(.yellow)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.cyan)
                    },
                    onTap: {
                        print("!!! CardView on tapped !!!")
                    })
            }
            
            HStack(spacing: 20.0) {
                // customize title view's font and background view
                CardView(
                    size: CGSize(width: 150.0, height: 200.0),
                    title: "Font",
                    cover: {
                        Image(systemName: "message.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 100.0, height: 100.0)
                    }, detail: {
                        Image(systemName: "star.fill")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .foregroundColor(.yellow)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.pink)
                })
                // change font for title
                .titleFont(.title.bold())
                // change color for title
                .titleColor(.cyan)
                // change title alignment
                .titleAlignment(.leading)
                // change linear gradient
                .backgroundColor(colors: [.blue, .cyan])
                // change the card's shadow
                .cardShadow(color: .blue, radius: 16.0)
                
                // customize detail view type and customize the whole title view
                CardView(
                    size: CGSize(width: 150.0, height: 200.0),
                    title: "",
                    detailViewType: .popover(),
                    cover: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 100.0, height: 100.0)
                    },
                    detail: {
                        Image(systemName: "sparkles")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .foregroundColor(.yellow)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.mint)
                })
                .replaceTitleView(with: AnyView(
                    HStack {
                        Image(systemName: "heart")
                        Text("AnyView")
                    }
                    .font(.title2)
                    .foregroundColor(.white)
                ))
            }
        }
    }
}

struct CompleteExample_Previews: PreviewProvider {
    static var previews: some View {
        CompleteExample()
    }
}
