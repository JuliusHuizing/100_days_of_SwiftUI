//
//  ContentView.swift
//  HabbitTracker
//
//  Created by Julius Huizing on 21/01/2021.
//

import SwiftUI
struct Habbit: Codable {
    var name: String
    var motivation: String
}
class Habbits: ObservableObject {
    @Published var habbits = [Habbit]() {
    didSet {
          let encoder = JSONEncoder()
          if let encoded = try? encoder.encode(habbits) {
              UserDefaults.standard.set(encoded, forKey: "habbits")
          }
        }
    }
}

struct ContentView: View {
    @ObservedObject var habbits = Habbits()
    @State private var showingAddSheet = false
    var body: some View {
        NavigationView {
            Form {
                List(habbits.habbits, id: \.name) { habbit in
                    NavigationLink(destination: ActivityView(activity: habbit)) {
                        Text(habbit.name)
                    }
                }
            }.navigationTitle("Habbits")
            .navigationBarItems(trailing: Button("Plus") {
                showingAddSheet = true
            })
        }.sheet(isPresented: $showingAddSheet) { AddSheet(habbits: habbits)}
    }
    init() {
        if let habbits = UserDefaults.standard.data(forKey: "habbits") {
                let decoder = JSONDecoder()
                if let decoded = try? decoder.decode([Habbit].self, from: habbits) {
                    self.habbits.habbits = decoded
                    return
                }
            }

        self.habbits.habbits = []
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
