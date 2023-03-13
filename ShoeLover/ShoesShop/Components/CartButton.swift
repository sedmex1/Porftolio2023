//
//  CartButton.swift
//  ShoesShop
//
//  Created by Dominik Kowalewski on 04/02/2023.
//

import SwiftUI

struct CartButton: View {
    
    var numberOfProducts: Int
    
    var body: some View {
        ZStack (alignment: .topTrailing) {
            
            Image(systemName: "cart")
                .padding(5)
                .foregroundColor(.black)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .shadow(color: .black.opacity(0.1), radius: 3, x: 1, y: 1)
                    .frame(width: 15, height: 15)
                    .background(Circle()
                        .fill(Color.orange))
                    .foregroundColor(.white)
            }
            
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberOfProducts: 1)
    }
}
