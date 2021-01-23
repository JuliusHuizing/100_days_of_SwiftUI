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
                    Picker ("Pick your type", selection: $order.content.typeIdx) {
                        ForEach (0..<OrderContent.types.count) {
                            Text(OrderContent.types[$0])
                        }
                        
                    }
                    Stepper("Number of cakes: \(order.content.quantity)", value: $order.content.quantity, in: 0...20)
                    
                }
                Section {
                    Toggle("Special toppings", isOn: $order.content.extraToppingsEnabled)
                    if order.content.extraToppingsEnabled {
                        Toggle("Sprinkles", isOn: $order.content.toppingSprinkles)
                        Toggle("Frosting", isOn: $order.content.toppingFrosting)
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
