//
//  ContentView.swift
//  PickTheFlag
//
//  Created by Julius Huizing on 13/01/2021.
//

import SwiftUI

struct Caption: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
            VStack {
                content
                Text(text)
            }
    }
}
extension View {
    func caption(with text:String) -> some View {
        modifier(Caption(text: text))
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0..<2)
    
    var targetCountry: String {
        return self.countries[correctAnswer]
    }
    
 
    
    
    @State private var showAlert: Bool = false
    @State private var SelectedCountry = 0
    @State private var message: String = ""
    @State private var score: Int = 0
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                Text("Pick the flag of...")
                Text("\(targetCountry)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                ForEach (0..<3 ) { number in
                    Button (action: {self.checkCorrectness(number)}, label: {
                        Image(self.countries[number])
                            .renderingMode(.original)
                        
                    })
                    .caption(with: "Hi")
                    
                    
                }
                Text("Score:")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    
                Text("\(String(score))")
                    .foregroundColor(.white)
                
            }
            
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Your Answer is"), message: Text("\(message)"), dismissButton: .default(Text("Continue")) {
                self.dismiss()
            })
        }
}
    
    func checkCorrectness(_ number:Int) {
        if number == correctAnswer {
            message = "Correct!"
            score += 1
        }
        else {
            message = "Incorrect..." + "\n That's the flag of \(self.countries[number])"
        }
        showAlert = true
    }
    func dismiss() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<3)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
