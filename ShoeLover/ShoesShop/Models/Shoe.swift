//
//  Shoe.swift
//  ShoesShop
//
//  Created by Dominik Kowalewski on 02/02/2023.
//

import Foundation
import PhotosUI

struct Shoe: Hashable {
    
    var id = UUID()
    var name: String
    var brand: String
    var photo: String
    var price: Int
    var sizes: [Int]
    var color: String
    var selectedSize: Int?
    var description: String?
}
