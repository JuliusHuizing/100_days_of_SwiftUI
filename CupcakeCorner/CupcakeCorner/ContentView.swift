//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Julius Huizing on 23/01/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = Order()
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker ("Pick your type", selection: $order.typeIdx) {
                        ForEach (0..<Order.types.count) {
                            Text(Order.types[$0])
                        }
                        
                    }
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 0...20)
                    
                }
                Section {
                    Toggle("Special toppings", isOn: $order.extraToppingsEnabled)
                    if order.extraToppingsEnabled {
                        Toggle("Sprinkles", isOn: $order.toppingSprinkles)
                        Toggle("Frosting", isOn: $order.toppingFrosting)
                    }
                
                
                   
                       
                }
                Section {
                    NavigationLink("Order Details", destination: OrderDetails(order: order))
                }
            
            }.navigationBarTitle("Cupecake Corner")
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
