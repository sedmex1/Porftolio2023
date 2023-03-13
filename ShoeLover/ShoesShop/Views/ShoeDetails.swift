//
//  ShoeDetails.swift
//  ShoesShop
//
//  Created by Dominik Kowalewski on 04/02/2023.
//

import SwiftUI

struct ShoeDetails: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var shoe: Shoe
    @State var selectedSize = 0
    
    var body: some View {
        ScrollView {
            VStack {
                Image(shoe.photo)
                    .resizable()
                    .scaledToFit()
                
                HStack (alignment: .top){
                    VStack (alignment: .leading, spacing: 10){
                        Text(shoe.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(shoe.brand)
                        
                    }
                    
                    Spacer()
                    
                    Text(String(shoe.price) + " PLN")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                }
                .padding(.horizontal)
                
                VStack (alignment: .center, spacing: 30) {
                    Button {
                        cartManager.addToCart(product: shoe)
                    } label: {
                        Text("Add To Cart")
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.black)
                                    .frame(width: 140, height: 40)
                            )
                    }
                }
                .padding(.top, 5)
                
//                                HStack {
//                                    ForEach(shoe.sizes, id: \.self) { size in
//                                        Text(String(size))
//                                            .font(.title3)
//                                            .fontWeight(.semibold)
//                                            .foregroundColor(.white)
//                                            .shadow(color: .black.opacity(0.1), radius: 1, x: 1, y: 1)
//                                            .padding(.horizontal, 5)
//                                            .background(RoundedRectangle(cornerRadius: 15)
//                                                .fill(selectedSize == size ? .black : .gray.opacity(0.3)))
//                                            .shadow(color: .black.opacity(0.2), radius: 5, x: 1, y: 1)
//                                            .scaleEffect(selectedSize == size ? 1.1 : 1)
//                                            .animation(.easeInOut(duration: 0.2), value: selectedSize)
//                                            .onTapGesture {
//                                                selectedSize = size
//                                                shoe.setSize(size: size)
//                                            }
//                                    }
//                                }
//                                .padding(.top)
//                                .padding(.horizontal)
                
                VStack (alignment: .leading, spacing: 10){
                    Text("Product Description")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text(shoe.description ?? "")
                        .multilineTextAlignment(.leading)
                }
                .padding(.top, 20)
                .padding(.horizontal)
                
            }
        }
        .toolbar {
            NavigationLink {
                CartView()
            } label: {
                CartButton(numberOfProducts: cartManager.products.count)
            }
        }
    }
}

struct ShoeDetails_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetails(shoe:  Shoe(name: "Air Jordan 4", brand: "Nike", photo: "aj4_unc", price: 2400, sizes: [38, 39, 40, 41, 42, 43, 44, 45], color: "blue", description: "Jordan Brand paid homage to MJ’s alma mater with the Air Jordan 4 University Blue. The University Blue colorway draws a close resemblance to the extremely rare Air Jordan 4 UNC PE that was given to Tarheel student-athletes in 2019.\n\nThe Air Jordan 4 University Blue features a University Blue suede upper with mesh netting on the quarter panel and tongue. Similar to OG Jordan 4 colorways of the past, the eyelets, heel tab, and sections of the midsole are a speckled Cement Grey. Hits of black appear on the wing eyelets, sole, and Jumpman logo on the heel tab. Two woven labels are stitched to the tongue; one being the classic Jumpman woven label; the other being a Team Jordan jock tag. A black, white, and Tech Grey sole with a clear Air unit completes the design.\n\nThe Air Jordan 4 University Blue released in April of 2021 and retailed for $200."))
            .environmentObject(CartManager())
    }
}
