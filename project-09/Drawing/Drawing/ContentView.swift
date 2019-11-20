//
//  ContentView.swift
//  Drawing
//
//  Created by Erik Waterham on 14/11/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
//

import SwiftUI

struct Arrow: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.maxX / 2, y: 0))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX / 4, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX / 4, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX * 3 / 4, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX * 3 / 4, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: 0))

        return path
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Arrow()
                .stroke(Color.red, lineWidth: 3)
                .frame(width: 200, height: 400)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
