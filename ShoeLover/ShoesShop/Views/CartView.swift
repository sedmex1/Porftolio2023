//
//  CartView.swift
//  ShoesShop
//
//  Created by Dominik Kowalewski on 04/02/2023.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            VStack {
                if cartManager.paymentSuccess {
                    
                } else {
                    if cartManager.products.count > 0 {
                        ForEach(cartManager.products, id: \.self) { item in
                            CartRow(product: item)
                        }
                        
                        Spacer()
                        
                        VStack {
                            HStack {
                                Text("Total")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                Text("\(cartManager.total) PLN")
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                            
                            PaymentButton(action: cartManager.pay)
                                .padding()
                        }
                        
                    } else {
                        Text("Your cart is empty 😰")
                    }
                }
            }
            
        }
        .navigationTitle("Cart")
        .padding(.top)
        .onDisappear{
            if cartManager.paymentSuccess {
                cartManager.paymentSuccess = false
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
