//
//  ContentView.swift
//  WeSplitFinal
//
//  Created by Julius Huizing on 11/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var AmountDue = ""
    @State private var tipIndex = 2
    @State private var peopleIndex = 0
    let percentages = [0, 5, 10, 15, 20]
    private var tipPercentage: Int {
        return self.percentages[self.tipIndex]
    }
    private var numberOfPeople: Double {
        return Double(peopleIndex) + 2
    }
    private var preTip: Double {
        return Double(AmountDue) ?? 0
    }
    private var tipAmount: Double {
        return (Double(tipPercentage) * 0.01) * self.preTip
    }
    private var totalAmountDue: Double {
        return preTip + tipAmount
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField ("Total Amount:", text: $AmountDue)
                }.keyboardType(.decimalPad)
                
                Section {
                    Picker("Number of people", selection: $peopleIndex) {
                        ForEach (2..<100) { number in
                            Text(String(number))
                        }
                    }
                }
                Section {
                    Picker("Tip Percentage", selection: $tipIndex) {
                        ForEach (0..<percentages.count) { percentage in
                            Text(String(self.percentages[percentage]))
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("Bill: \(self.preTip)")
                    Text("Tip: \(self.tipAmount)")
                        .foregroundColor(
                            tipPercentage == 0 ? .red : .black )
                    Text("Total amount due: \(self.totalAmountDue)")
                }
                
                Section {
                    Text("Number of people: \(self.numberOfPeople)")
                    Text("Cost per person: $\(self.totalAmountDue / self.numberOfPeople)")
                }
            }.navigationBarTitle("WeSplit")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
