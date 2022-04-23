//
//  ContentView.swift
//  SimpleCardView_Example
//
//  Created by Tomortec on 2022/4/23.
//  Copyright © 2022 Tomortec. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            HStack(spacing: 20.0) {
                CardView(
                    size: CGSize(width: 150.0, height: 200.0),
                    title: "Hello world",
                    backgroundColorTop: .yellow,
                    backgroundColorBottom: .orange,
                    cover: {
                    Image(systemName: "leaf.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                }, detail: {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .foregroundColor(.yellow)
                })
                
                CardView(
                    size: CGSize(width: 150.0, height: 200.0),
                    title: "Hello world",
                    backgroundColorTop: .pink,
                    backgroundColorBottom: .red,
                    cover: {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                }, detail: {
                    Image(systemName: "moon.stars.fill")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .foregroundColor(.yellow)
                })
            }
            
            HStack(spacing: 20.0) {
                CardView(
                    size: CGSize(width: 150.0, height: 200.0),
                    title: "Hello world",
                    backgroundColorTop: .blue,
                    backgroundColorBottom: .cyan,
                    cover: {
                    Image(systemName: "message.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                }, detail: {
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .foregroundColor(.yellow)
                })
                
                CardView(
                    size: CGSize(width: 150.0, height: 200.0),
                    title: "Hello world",
                    backgroundColorTop: .green,
                    backgroundColorBottom: .teal,
                    cover: {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                }, detail: {
                    Image(systemName: "sparkles")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .foregroundColor(.yellow)
                })
            }
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
