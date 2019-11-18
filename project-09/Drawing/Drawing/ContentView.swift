//
//  ContentView.swift
//  Drawing
//
//  Created by Erik Waterham on 14/11/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var colorCycle = 0.0

    var body: some View {
        ZStack {
            Image("PaulHudson")

            Rectangle()
                .fill(Color.red)
                .blendMode(.multiply)
        }
        .frame(width: 400, height: 500)
        .clipped()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
