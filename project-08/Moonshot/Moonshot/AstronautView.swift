//
//  AstronautView.swift
//  Moonshot
//
//  Created by Erik Waterham on 13/11/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]
    let crewMissions: [Mission]

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)

                    ForEach (self.crewMissions) { mission in
                        Text(mission.displayName)
                            .font(.headline)
                            .padding()
                    }
                }

                Spacer(minLength: 25)

            }
        }
    }

    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        self.missions = missions

        var matches = [Mission]()

        for mission in self.missions {
            for crewRole in mission.crew {
                if crewRole.name == astronaut.id {
                    matches.append(mission)
                }
            }
        }

        self.crewMissions = matches
    }

}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
