//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Erik Waterham on 01/11/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
//

import SwiftUI

struct LargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeTitle() -> some View {
        self.modifier(LargeTitle())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
        .largeTitle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
