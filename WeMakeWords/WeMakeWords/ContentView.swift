//
//  ContentView.swift
//  WeMakeWords
//
//  Created by Julius Huizing on 15/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var newWord = ""
    @State private var usedWords = [String]()
    
    let alertTitle = "Error"
    @State private var showAlertMessage = false
    @State private var alertMessage = ""
    @State private var allWords = [String] ()
    @State private var currentWord: String = "Hi"
    
    var body: some View {
        Form {
            Text("\(currentWord)")
            TextField ("Make your word", text: $newWord, onCommit: tryWord)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            
            List (usedWords, id: \.self) {
                Text("\($0)")
            }
        }.onAppear(perform: startGame)
        .alert(isPresented: $showAlertMessage) {
            Alert (title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK.")))
            
        }
    }
    
    enum startGameError: Error {
        case couldNotLoadFile
        case couldNotConvertToString
        case couldNotSeperateByNewLine
    }
    
    func loadWords() throws -> URL {
        guard let wordsURL = Bundle.main.url(forResource: "start", withExtension: "txt")
        else {
            throw startGameError.couldNotLoadFile
            
        }
        return wordsURL
    }
    
    func makeString(url:URL) throws -> String {
        if let string = try? String(contentsOf: url) {
            return string
        } else {
            throw startGameError.couldNotConvertToString
            
        }
    }
    func makeList (longString:String) -> [String] {
        return longString.components(separatedBy: "\n")
    }

    
    func startGame() -> Void {
        if let wordsURl = try? loadWords() {
            if let longString = try? makeString(url: wordsURl) {
                allWords = makeList(longString: longString)
                currentWord = allWords.randomElement()!
                return
                }
            }
        fatalError()
        }
    
    func isUnique() -> Bool {
        return !usedWords.contains(newWord)
    }
    
    func addNewWord() -> Void {
        usedWords.insert(newWord, at: 0)
        newWord = ""
    }
    func tryWord() -> Void {
        if !isUnique() {
            alertMessage = "You already used that word!"
            showAlertMessage = true
        }
        else {
            addNewWord()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
