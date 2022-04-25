//
//  ContentView.swift
//  SimpleCardView_Example
//
//  Created by Tomortec on 2022/4/23.
//  Copyright © 2022 Tomortec. All rights reserved.
//

import SwiftUI
import SimpleCardView_SwiftUI

struct ContentView: View {
    
    enum DemoType {
        case simple
        case complete
    }
    
    @State var demoType: DemoType = .complete
    
    var body: some View {
        VStack {
            Button("Switch demo type") {
                demoType = demoType == .complete ? .simple : .complete
            }
            .padding(.vertical, 50)
            
            switch demoType {
            case .simple:
                SimpleExample()
            case .complete:
                CompleteExample()
            }
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
