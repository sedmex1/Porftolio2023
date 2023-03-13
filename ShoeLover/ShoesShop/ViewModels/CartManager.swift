//
//  CartManager.swift
//  ShoesShop
//
//  Created by Dominik Kowalewski on 04/02/2023.
//

import Foundation

class CartManager: ObservableObject {
    
    @Published private(set) var products: [Shoe] = []
    @Published private(set) var total: Int = 0
    
    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false
    
    func addToCart(product: Shoe) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Shoe) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
    
    func pay() {
        paymentHandler.startPayment(products: products, total: total) { success in
            self.paymentSuccess = success
            self.products = []
            self.total = 0
        }
    }
    
}

