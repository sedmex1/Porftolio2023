//
//  ContentView.swift
//  ShoesShop
//
//  Created by Dominik Kowalewski on 02/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    @EnvironmentObject var shoeModel: ShoeModel
    
    var body: some View {
        ProductsView()
            .environmentObject(CartManager())
            .environmentObject(ShoeModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
