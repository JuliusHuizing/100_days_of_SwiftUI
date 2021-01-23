//
//  ContentView.swift
//  WeSplit
//
//  Created by Julius Huizing on 11/01/2021.
//

import SwiftUI

struct ContentView: View {
    let students = ["Teun", "Putri", "Julius"]
    @State private var count = 0
    @State private var name = ""
    @State private var selectedStudent = 0
    var body: some View {
        Form {
            Section {
                Button("You pressed me \(self.count) times!"){
                    self.count += 1
                }
                TextField("Enter your name:", text: $name)
            }
        
            Section {
                Text("Hi there \(self.name)!")
            }
            
            Section {
                Text("A Row for each student:")
                ForEach (0..<students.count) { number in
                    Text("Row \(number)")
                }
                    }
                }
                
            }
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
