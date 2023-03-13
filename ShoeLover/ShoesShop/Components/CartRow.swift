//
//  CartRow.swift
//  ShoesShop
//
//  Created by Dominik Kowalewski on 04/02/2023.
//

import SwiftUI

struct CartRow: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var shoeModel: ShoeModel
    
    var product: Shoe
    
    var body: some View {
        VStack {
            HStack (spacing: 20) {
                Image(product.photo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                
                VStack (alignment: .leading, spacing: 3){
                    Text(product.name)
                        .font(.headline)
                    
                    Text(String(product.price) + " PLN")
                        .font(.caption)
                }
                
                Spacer()
                
                Image(systemName: "trash")
                    .padding()
                    .onTapGesture {
                        cartManager.removeFromCart(product: product)
                    }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
        }
    }
}

struct CartRow_Previews: PreviewProvider {
    static var previews: some View {
        CartRow(product:  Shoe(name: "Air Jordan 4", brand: "Nike", photo: "aj4_unc", price: 2400, sizes: [38, 39, 40, 41, 42, 43, 44, 45], color: "blue", description: "Jordan Brand paid homage to MJ’s alma mater with the Air Jordan 4 University Blue. The University Blue colorway draws a close resemblance to the extremely rare Air Jordan 4 UNC PE that was given to Tarheel student-athletes in 2019.\n\nThe Air Jordan 4 University Blue features a University Blue suede upper with mesh netting on the quarter panel and tongue. Similar to OG Jordan 4 colorways of the past, the eyelets, heel tab, and sections of the midsole are a speckled Cement Grey. Hits of black appear on the wing eyelets, sole, and Jumpman logo on the heel tab. Two woven labels are stitched to the tongue; one being the classic Jumpman woven label; the other being a Team Jordan jock tag. A black, white, and Tech Grey sole with a clear Air unit completes the design.\n\nThe Air Jordan 4 University Blue released in April of 2021 and retailed for $200."))
            .environmentObject(CartManager())
            .environmentObject(ShoeModel())
    }
}
