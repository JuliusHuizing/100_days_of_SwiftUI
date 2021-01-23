//
//  OrderDetails.swift
//  CupcakeCorner
//
//  Created by Julius Huizing on 23/01/2021.
//

import SwiftUI

struct OrderDetails: View {
    @ObservedObject var order: Order
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
            }
            Section {
                TextField("City", text: $order.city)
                TextField("Zip Code", text: $order.zip)
                TextField("Adress", text: $order.adress)
                
            }
            Section {
                TextField("Special remarks", text: $order.specialRemarks)
            }
            Section {
                NavigationLink("Checkout", destination: CheckoutView(order: order))
                    .disabled(!order.enoughInformationProvided)
            }
        }.navigationBarTitle("Order Details")
    }
    
}

struct OrderDetails_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetails(order: Order())
    }
}
