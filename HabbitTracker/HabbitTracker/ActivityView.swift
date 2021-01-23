//
//  ActivityView.swift
//  HabbitTracker
//
//  Created by Julius Huizing on 21/01/2021.
//

import SwiftUI

struct ActivityView: View {
    var activity: Habbit
    var body: some View {
        NavigationView {
            VStack {
                Text("Motivation")
                    .font(.title)

                Text("\(activity.motivation)")
                    
            }.navigationTitle("\(activity.name)")
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static let activity = Habbit(name: "Some", motivation: "Some")
    static var previews: some View {
        ActivityView(activity: activity)
    }
}
