//
//  HomeView.swift
//  ShoesShop
//
//  Created by Dominik Kowalewski on 02/02/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var shoeModel: ShoeModel
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(shoeModel.shoesList, id: \.id) { item in
                        NavigationLink(value: item) {
                            ShoeCard(shoe: item)
                        }
                    }
                }
                .padding(.horizontal)
                .navigationDestination(for: Shoe.self, destination: { shoe in
                    ShoeDetails(shoe: shoe)
                })
            }
            .navigationBarTitle("Shoes")
            .toolbar {
                NavigationLink {
                    CartView()
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CartManager())
            .environmentObject(ShoeModel())
    }
}
