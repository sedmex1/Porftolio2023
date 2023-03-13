//
//  ShoeBigCard.swift
//  ShoesShop
//
//  Created by Dominik Kowalewski on 03/03/2023.
//
import SwiftUI

struct ShoeBigCard: View {
    @EnvironmentObject var cartMnager: CartManager
    var shoe: Shoe
    var body: some View {
        
        ZStack (alignment: .top){
            
            Rectangle()
                .fill(.black)
            
            VStack (alignment: .leading) {
                Image(shoe.photo)
                    .resizable()
                    .frame(width: 380, height: 280)
                
                HStack {
                    VStack (alignment: .leading, spacing: 4){
                        Text(shoe.name)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(shoe.brand)
                            .foregroundColor(.white)
                            .font(.caption)
                        
                        Text(String(shoe.price) + " PLN")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal, 10)
                    
                    Spacer()
                    
                    Text("Add To Cart")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(9)
                        .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white))
                    .onTapGesture {
                        cartMnager.addToCart(product: shoe)
                    }
                    .padding(.horizontal)
                }
                
                
            }
            
        }
        .frame(width: 380, height: 360)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.2), radius: 12, x: 7, y: 7)
        
        
    }
}

struct ShoeBigCard_Previews: PreviewProvider {
    static var previews: some View {
        ShoeBigCard(shoe:  Shoe(name: "Air Jordan 4", brand: "Nike", photo: "aj4_unc", price: 2400, sizes: [38, 39, 40, 41, 42, 43, 44, 45], color: "blue", description: "Jordan Brand paid homage to MJ’s alma mater with the Air Jordan 4 University Blue. The University Blue colorway draws a close resemblance to the extremely rare Air Jordan 4 UNC PE that was given to Tarheel student-athletes in 2019.\n\nThe Air Jordan 4 University Blue features a University Blue suede upper with mesh netting on the quarter panel and tongue. Similar to OG Jordan 4 colorways of the past, the eyelets, heel tab, and sections of the midsole are a speckled Cement Grey. Hits of black appear on the wing eyelets, sole, and Jumpman logo on the heel tab. Two woven labels are stitched to the tongue; one being the classic Jumpman woven label; the other being a Team Jordan jock tag. A black, white, and Tech Grey sole with a clear Air unit completes the design.\n\nThe Air Jordan 4 University Blue released in April of 2021 and retailed for $200."))
            .environmentObject(CartManager())
    }
}

