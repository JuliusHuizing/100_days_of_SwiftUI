//
//  ContentView.swift
//  metDante
//
//  Created by Julius Huizing on 17/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Hi there")
            Text("Hello, world!")
                .padding()
                .foregroundColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

