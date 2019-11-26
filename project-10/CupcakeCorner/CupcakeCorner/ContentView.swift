//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Erik Waterham on 21/11/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var username = ""
    @State var email = ""

    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }

            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            .disabled(disableForm)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
