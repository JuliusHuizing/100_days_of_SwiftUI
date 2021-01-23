//
//  MissionView.swift
//  Moonshot
//
//  Created by Julius Huizing on 19/01/2021.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let mission: Mission
    let crewMembers: [CrewMember]
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.imageName)
                    .resizable()
                    .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text(mission.name)
                        .font(.largeTitle)
                HStack {
                    List(crewMembers, id: \.role) { crewMember in
                        NavigationLink(destination: Text("Hi")) {
                            HStack {
                                Image(crewMember.astronaut.imageName)
                                    .resizable()
                                    .frame(width: 83, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                                VStack {
                                    Text(crewMember.astronaut.name)
                                    Text(crewMember.role)
                                }
                        }
                        }
                    }
                }
                    Text(mission.description)
                        .padding()
                }
        }
        }
    
    init (mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        var tempCrewMembers = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: {$0.id == member.name}) {
                tempCrewMembers.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("No matching crew member found.")
            }
        }
        self.crewMembers = tempCrewMembers
    }
        
    
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
    }
}
