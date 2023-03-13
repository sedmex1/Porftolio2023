//
//  ProductsView.swift
//  ShoesShop
//
//  Created by Dominik Kowalewski on 18/02/2023.
//

import SwiftUI

struct ProductsView: View {
    
    @EnvironmentObject var shoeModel: ShoeModel
    @EnvironmentObject var cartManager: CartManager
    @State var selectedColor: String = ""
    @State var showFilters = false
    @State var showGridView = true
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var columns2 = [GridItem(.adaptive(minimum: 360), spacing: 20)]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        ZStack {
                            if showGridView {
                                Image(systemName: "square.grid.2x2.fill")
                                    .hAlign(.leading)
                                    .padding(.horizontal, 20)
                                    .font(.title3)
                                    .onTapGesture {
                                        showGridView.toggle()
                                    }
                            } else {
                                Image(systemName: "square.fill")
                                    .transition(.opacity)
                                    .zIndex(1)
                                    .hAlign(.leading)
                                    .padding(.horizontal, 20)
                                    .font(.title3)
                                    .onTapGesture {
                                        showGridView.toggle()
                                    }
                            }
                        }
                        Text("Filters")
                            .font(.headline)
                            .hAlign(.trailing)
                            .padding(.horizontal, 20)
                            .onTapGesture {
                                showFilters.toggle()
                            }
                    }
                    if showGridView {
                        LazyVGrid (columns: columns, spacing: 14) {
                            
                            if shoeModel.activeList.isEmpty {
                                ForEach(shoeModel.shoesList, id: \.id) { product in
                                    NavigationLink(value: product) {
                                        ShoeCard(shoe: product)
                                    }
                                }
                            } else {
                                ForEach(shoeModel.activeList, id: \.id) { product in
                                    NavigationLink(value: product) {
                                        ShoeCard(shoe: product)
                                    }
                                }
                            }
                        }
                        .navigationDestination(for: Shoe.self, destination: { shoe in
                            ShoeDetails(shoe: shoe)
                        })
                        .padding(.horizontal, 14)
                        .navigationBarTitle("Shoes")
                        .toolbar {
                            NavigationLink {
                                CartView()
                            } label: {
                                CartButton(numberOfProducts: cartManager.products.count)
                            }
                        }
                    } else {
                        LazyVStack (spacing: 20) {
                            
                            if shoeModel.activeList.isEmpty {
                                ForEach(shoeModel.shoesList, id: \.id) { product in
                                    NavigationLink(value: product) {
                                        ShoeBigCard(shoe: product)
                                    }
                                }
                            } else {
                                ForEach(shoeModel.activeList, id: \.id) { product in
                                    NavigationLink(value: product) {
                                        ShoeBigCard(shoe: product)
                                    }
                                }
                            }
                        }
                        .navigationDestination(for: Shoe.self, destination: { shoe in
                            ShoeDetails(shoe: shoe)
                        })
                        .padding(.horizontal, 14)
                        .navigationBarTitle("Shoes")
                        .toolbar {
                            NavigationLink {
                                CartView()
                            } label: {
                                CartButton(numberOfProducts: cartManager.products.count)
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $showFilters) {
                FiltersTab()
        }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
            .environmentObject(ShoeModel())
            .environmentObject(CartManager())
    }
}
