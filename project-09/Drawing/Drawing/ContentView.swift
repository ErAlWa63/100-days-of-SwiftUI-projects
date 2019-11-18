//
//  ContentView.swift
//  Drawing
//
//  Created by Erik Waterham on 14/11/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var amount: CGFloat = 0.0

    var body: some View {
        VStack {
            Image("PaulHudson")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .saturation(Double(amount))
            .blur(radius: (1 - amount) * 20)

            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
