//
//  ContentView.swift
//  Moonshot
//
//  Created by Erik Waterham on 11/11/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State var showCrew = false


    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts, missions: self.missions)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if self.showCrew {
                            Text(self.crewNames(mission: mission, astronauts: self.astronauts))
                                .font(.subheadline)
                        }
                        else {
                            Text(mission.formattedLaunchDate)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showCrew.toggle()
                }, label: {
                    Text("Show \(self.showCrew ? "date" : "crew")")
                })
            )
        }
    }
    func crewNames(mission: Mission, astronauts: [Astronaut], separator: Character = "\n") -> String {
        var crewNames = ""

        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                crewNames += match.name + String(separator)
            }
            else {
                fatalError("Crew member \(member.name) not found")
            }
        }

        return String(crewNames.dropLast())
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
