//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Julius Huizing on 23/01/2021.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State var confirmationMessage = ""
    @State var showingConfirmation = false
    var body: some View {
        Form {
            Text("Total Cost: $ \(order.totalCost)")

            Section {
                Text("Number of cupcakes: \(order.quantity)")
                Text("Comment: \(order.specialRemarks)")
            }
            
            Button("Place order", action: placeOrder)
        }.navigationBarTitle("Checkout")
        .alert(isPresented: $showingConfirmation) {
            Alert(title: Text("Thank you!"), message: Text(confirmationMessage), dismissButton: .default(Text("OK"))) }
        
    }
    
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else { print("Failed to encode order.")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                confirmationMessage = "Something went wrong with connceting to the server. Please check if you have an active internet connection"
                self.showingConfirmation = true
                return
            }
            // Check whether response from reqres can be decoded again.
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.typeIdx].lowercased()) cupcakes is on its way!"
                self.showingConfirmation = true

            } else {
                print("Invalid response from server")
            }
            

        }.resume()
        
        
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
