//
//  ContentView.swift
//  LengthConversion
//
//  Created by Julius Huizing on 13/01/2021.
//

import SwiftUI

struct ContentView: View {
    let units: [String] = ["kilometers", "meters", "feet", "yards", "miles"]
    let conversionToFeet: [String:Double] =
        ["kilometers":3280.8399,
         "meters": 3.2808399,
         "feet": 1,
         "yards": 3,
         "miles": 5280]

    @State private var fromIdx = 0
    @State private var toIdx = 3
    @State private var inputLengthString = "1"
    
    var inputLength: Double {
        return Double(inputLengthString) ?? 0
    }
    var inputMetric: String {
        return self.units[fromIdx]
    }
    var outputMetric: String {
        return self.units[toIdx]
    }
    
    private var outputLength: Double {
        let feet: Double = (self.conversionToFeet[inputMetric] ?? 0) * inputLength
        let denominator = self.conversionToFeet[outputMetric] ?? 0
        let outputLength = (1 / denominator) * feet
        return outputLength
    }
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("From:")) {
                    TextField ("Input Length", text: $inputLengthString)
                        .keyboardType(.decimalPad)
                    Picker ("From Picker", selection: $fromIdx) {
                        ForEach (0 ..< self.units.count) {
                            Text(self.units[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section (header: Text("To:")) {
                    Picker ("To Picker", selection: $toIdx) {
                        ForEach (0 ..< self.units.count) {
                            Text(self.units[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    
                    Text("\(inputLength, specifier:"%.2f") \(inputMetric) is \(outputLength, specifier:"%.2f") \(outputMetric)")
                }
            }.navigationBarTitle("Length  Convertor")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
