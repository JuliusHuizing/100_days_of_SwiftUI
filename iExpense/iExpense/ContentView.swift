//
//  ContentView.swift
//  iExpense
//
//  Created by Julius Huizing on 17/01/2021.
//

import SwiftUI

struct Expense: Codable {
    var name: String
    var type: String
    var amount: Double
}

// Also see Utils.swift
class Expenses: ObservableObject {
    @Published var items: [Expense] {
        didSet {
            if let encoded = try? encodeItems(items: items) {
              saveData(save: encoded, as: "Items")
            }
            
        }
    }
    init() {
        if let encodedItems = getData(key: "Items") {
            if let decoded = try? decodeItems(encoded: encodedItems) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddView = false
    var body: some View {
        NavigationView {
            Form {
                ForEach(expenses.items, id: (\.self.name)) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(String(item.amount))
                        Spacer()
                        Text(item.type)
                      
                    }.padding()
                }
                .onDelete(perform: { indexSet in
                    expenses.items.remove(atOffsets: indexSet)
                })
            }.navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton())
            .navigationBarItems(trailing: Button("Add Expense") {
                showingAddView = true
            })
        }
        .sheet(isPresented: $showingAddView, content: {
            AddView(expenses: expenses)
        })
        }
    
    func addExpense() {
        let expense = Expense(name: "Test", type: "Test Type", amount: 10.0)
        expenses.items.append(expense)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

