//
//  AddView.swift
//  iExpense
//
//  Created by Julius Huizing on 17/01/2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    var expenses: Expenses
    @State private var expenseName = ""
    @State private var expenseAmount = ""
    private let types = ["Business", "Personal", "Other"]
    @State private var expenseTypeIdx = 1 // defaults to personal
    var expenseType: String {
        return types[expenseTypeIdx]
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField ("Name", text: $expenseName)
                    Picker ("Type", selection: $expenseTypeIdx) {
                        ForEach (0..<types.count) { typeIdx in
                            Text("\(self.types[typeIdx])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    TextField ("Amount", text: $expenseAmount)
                        .keyboardType(.decimalPad)
                }
                Section {
                    Button ("Add expense", action: addExpense)
                }
            }.navigationBarTitle("Add Expense")
        }
    }
    func addExpense() {
        if let amount = Double(expenseAmount) {
            let expense = Expense(name: expenseName, type: expenseType, amount: amount)
            expenses.items.append(expense)
            self.presentationMode.wrappedValue.dismiss()
    }
    }
    
    
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
