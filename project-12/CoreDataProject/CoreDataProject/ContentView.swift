//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Erik Waterham on 06/12/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc

    var body: some View {
        Button("Save") {
            if self.moc.hasChanges {
                try? self.moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
