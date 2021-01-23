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
                TextField("Name", text: $order.content.name)
            }
            Section {
                TextField("City", text: $order.content.city)
                TextField("Zip Code", text: $order.content.zip)
                TextField("Adress", text: $order.content.adress)
                
            }
            Section {
                TextField("Special remarks", text: $order.content.specialRemarks)
            }
            Section {
                NavigationLink("Checkout", destination: CheckoutView(order: order))
                    .disabled(!order.content.enoughInformationProvided)
            }
        }.navigationBarTitle("Order Details")
    }
    
}

struct OrderDetails_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetails(order: Order())
    }
}
