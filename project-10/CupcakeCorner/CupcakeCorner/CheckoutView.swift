//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Erik Waterham on 26/11/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: OrderWrapper
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false

    @State private var confirmationTitle = ""

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)

                    Text("Your total is $\(self.order.order.cost, specifier: "%.2f")")
                        .font(.title)

                    Button("Place Order") {
                        self.placeOrder()

                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert(isPresented: $showingConfirmation) {
            Alert(title: Text(confirmationTitle), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
    }

    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            confirmationTitle = "Error"
            confirmationMessage = "Failed to encode order"
            showingConfirmation = true
            
            print("Failed to encode order")
            return
        }

        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                self.confirmationTitle = "Error"
                self.confirmationMessage = "No data in response: \(error?.localizedDescription ?? "Unknown error")."
                self.showingConfirmation = true

                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            if let decodedOrder = try? JSONDecoder().decode(OrderWrapper.self, from: data) {
                self.confirmationTitle = "Thank you!"
                self.confirmationMessage = "Your order for \(decodedOrder.order.quantity)x \(Order.types[decodedOrder.order.type].lowercased()) cupcakes is on its way!"
                self.showingConfirmation = true
            } else {
                self.confirmationTitle = "Error"
                self.confirmationMessage = "Invalid response from server"
                self.showingConfirmation = true

                print("Invalid response from server")
            }
        }.resume()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: OrderWrapper())
    }
}
