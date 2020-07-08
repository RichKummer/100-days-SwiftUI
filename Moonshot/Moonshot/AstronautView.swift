//
//  AstronautView.swift
//  Moonshot
//
//  Created by RichK on 5/2/20.
//  Copyright © 2020 Rich Kummer. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
  let astronaut: Astronaut
  let missions: [Mission]

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

          VStack(alignment: .leading) {
            Text("Missions")
              .font(.headline)

            ForEach(self.missions) { mission in
              HStack {
                Image(mission.image)
                .resizable()
                .scaledToFit()
                  .frame(width: 44, height: 44)

                Text(mission.displayName)

                Spacer()
              }
            }
          }
        .padding()
        }
      }
    }
    .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
  }

  init(astronaut: Astronaut) {
    self.astronaut = astronaut
    let allMissions: [Mission] = Bundle.main.decode("missions.json")

    var matches = [Mission]()

    for mission in allMissions {
      if let _ = mission.crew.first(where: { $0.name == astronaut.id }) {
        matches.append(mission)
      }
    }

    self.missions = matches
  }
}

struct AstronautView_Previews: PreviewProvider {
  static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
  static var previews: some View {
    AstronautView(astronaut: astronauts[0])
  }
}
