//
//  ContentView.swift
//  WeRest
//
//  Created by Julius Huizing on 15/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var amountOfSleep: Double = 8

    var body: some View {
        Text("How much !")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
