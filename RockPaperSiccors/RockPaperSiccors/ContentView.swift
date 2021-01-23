//
//  ContentView.swift
//  RockPaperSiccors
//
//  Created by Julius Huizing on 15/01/2021.
//

import SwiftUI

struct ContentView: View {
    let options: [String] = ["Rock", "Paper", "Siccors"]
    let winDict: [String:String] = ["Rock": "Paper", "Paper": "Siccors", "Siccors": "Rock"]
    @State private var win = Bool.random()
    
    @State private var computerChoiceIdx = Int.random(in: 0..<3)
    @State private var yourChoiceIdx: Int = 0
    
    @State private var message = "?"
    @State private var score:Int = 0
    @State private var isCorrect: Bool = true
    
    var computerChoice: String {
        return options[computerChoiceIdx]
    }
    var yourChoice: String {
        return options[yourChoiceIdx]
    }
    var body: some View {
        VStack {
            VStack {
                Text("Computer chooses:")
                Text("\(computerChoice).")
                    .font(.title)
            }.padding()
            
            Text("Pick a move to")
            Text("\(win ? "Win":"Lose")")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            HStack {
                ForEach (0..<options.count) { number in
                    Button ("\(self.options[number])") {
                        yourChoiceIdx = number
                        let haswon = willWin(you: yourChoice, computer: computerChoice, windict: winDict)
                        update(hasWon: haswon, neededToWin: win)
                        }
                }.padding()
            
            }
            Text("\(message)")
                .font(.title)
                .foregroundColor(isCorrect ? .green: .red)
            
            VStack {
                Text("Score:")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("\(score)")
                    .font(.title)
            }.padding()
        }
            
            

    }

    func willWin (you: String, computer: String, windict: [String:String]) -> Bool {
        if windict[computer] == you {
            return true
        }
        else {
            return false
        }
    }
    func update (hasWon: Bool, neededToWin: Bool) -> () {
        if (hasWon && neededToWin) || (!hasWon && !neededToWin)  {
            message = "Correct"
            score += 1
            isCorrect = true
        }
        else {
            message = "Incorrect"
            isCorrect = false
        }
        computerChoiceIdx = Int.random(in: 0..<3)
        win = Bool.random()
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
