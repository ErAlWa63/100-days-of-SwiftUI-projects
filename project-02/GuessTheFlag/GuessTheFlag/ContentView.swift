//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Erik Waterham on 31/10/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var name: String

    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0

    @State private var spinAnimationAmounts = [0.0, 0.0, 0.0]
    @State var animateOpacity = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)

                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        FlagImage(name: self.countries[number])
                        .rotation3DEffect(.degrees(self.spinAnimationAmounts[number]), axis: (x: 0, y: 1, z: 0))
                            .opacity(self.animateOpacity ? (number == self.correctAnswer ? 1 : 0.25) : 1)
                    }
                }
                Text("Current score is \(score)")
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
                })
        }
    }

    func flagTapped(_ number: Int) {
        withAnimation(Animation.easeInOut(duration: 2)) {
            self.animateOpacity = true
        }

        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            withAnimation(Animation.easeInOut(duration: 2)) {
                spinAnimationAmounts[number] += 360
            }
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])."
            score -= 1
        }

        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        spinAnimationAmounts = [0.0, 0.0, 0.0]
        animateOpacity = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
