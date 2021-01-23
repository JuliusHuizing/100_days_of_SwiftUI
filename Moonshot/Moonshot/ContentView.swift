//
//  ContentView.swift
//  Moonshot
//
//  Created by Julius Huizing on 19/01/2021.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        NavigationView {
         
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)){
                    HStack {
                        Image(mission.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 44, height: 44)
                        VStack {
                        Text(mission.name)
                        Text(mission.launchDate ?? "N/A")
                            .foregroundColor(.gray)
                        }
                    }

                }
            }.navigationBarTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
