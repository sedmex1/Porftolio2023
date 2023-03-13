//
//  ShoeModel.swift
//  ShoesShop
//
//  Created by Dominik Kowalewski on 18/02/2023.
//

import Foundation

class ShoeModel: ObservableObject {
    
    @Published var activeList: [Shoe] = []
    @Published var shoesColors = ["shoe_white", "shoe_yellow", "shoe_blue", "shoe_red", "shoe_green", "shoe_purple", "shoe_gray", "shoe_black"]
    @Published var brandList = ["Nike", "Adidas"]
    @Published var colorsFiltered: Bool = false
    @Published var brandsFiltered: Bool = false
    
    private func filterColor(_ list: [Shoe], colors: [String]) -> [Shoe] {
        
        var filtered: [Shoe] = []
        
        if !colors.isEmpty {
            for color in colors {
                for i in list {
                    if color == i.color {
                        filtered.append(i)
                    }
                }
            }
            colorsFiltered = true
            return filtered
        } else {
            colorsFiltered = false
            return list
        }
    }
    
    private func filterBrand(_ list: [Shoe], brands: [String]) -> [Shoe] {
        
        var filtered: [Shoe] = []
        
        if !brands.isEmpty {
            for brand in brands {
                for i in list {
                    if brand == i.brand {
                        filtered.append(i)
                    }
                }
            }
            brandsFiltered = true
            return filtered
        } else {
            brandsFiltered = false
            return list
        }
    }
    
    func filterShoes(_ list: [Shoe], colors: [String], brands: [String]) -> [Shoe] {
        
        var filtered = list
        
        filtered = filterColor(list, colors: colors)
        
        filtered = filterBrand(filtered, brands: brands)
        
        return filtered
    }
    
    func fetchColors(_ list: [Shoe]) -> [String] {
        
        var fetchedColors: [String] = []
        
        for item in list {
            fetchedColors.append(item.color)
        }
        
        return fetchedColors
    }
    
    func fetchBrands(_ list: [Shoe]) -> [String] {
        
        var fetchedBrands: [String] = []
        
        for item in list {
            fetchedBrands.append(item.brand)
        }
        
        return fetchedBrands
    }
    
    @Published var shoesList = [
        Shoe(name: "Air Jordan 1", brand: "Nike", photo: "aj1_chicago", price: 1600, sizes: [], color: "shoe_red", description: "The original Air Jordan 1 Chicago colorway was first introduced in 1985 and has only been retroed a few times since. But 2022 is the year that the colorway returns with an added vintage look. Pre-yellowed accents and cracked leather uppers showcase a fabricated look of age and wear. \n\nThe Air Jordan 1 Lost and Found Chicago released in November of 2022 for $180."),
        Shoe(name: "Air Jordan 4", brand: "Nike", photo: "aj4_unc", price: 2400, sizes: [38, 39, 40, 41, 42, 43, 44, 45], color: "shoe_blue", description: "Jordan Brand paid homage to MJ’s alma mater with the Air Jordan 4 University Blue. The University Blue colorway draws a close resemblance to the extremely rare Air Jordan 4 UNC PE that was given to Tarheel student-athletes in 2019.\n\nThe Air Jordan 4 University Blue features a University Blue suede upper with mesh netting on the quarter panel and tongue. Similar to OG Jordan 4 colorways of the past, the eyelets, heel tab, and sections of the midsole are a speckled Cement Grey. Hits of black appear on the wing eyelets, sole, and Jumpman logo on the heel tab. Two woven labels are stitched to the tongue; one being the classic Jumpman woven label; the other being a Team Jordan jock tag. A black, white, and Tech Grey sole with a clear Air unit completes the design.\n\nThe Air Jordan 4 University Blue released in April of 2021 and retailed for $200."),
        Shoe(name: "Air Jordan 4", brand: "Nike", photo: "aj4_offwhite", price: 4000, sizes: [], color: "shoe_white", description: "Jordan Brand and Virgil Abloh teamed up once again to release the third silhouette in their collaborative history with the women's Jordan 4 Retro Off-White Sail (W), now available on StockX. After teasing the release of the Off-White 4 with samples in his MCA exhibit and presenting them in his Off-White FW2020 Women’s Show, Virgil Abloh finally delivered what might be the most anticipated release of 2020. The Air Jordan 4 Sail features full-grain leather uppers with hits of mesh and translucent materials on the toebox and heel of the shoe. From there, hits of light blue on the tongue’s Jumpman and the outsole’s Nike Swoosh provide contrast to the sail colored sneaker. \n\nThese women's sneakers released in July of 2020 and retailed for $200 USD."),
        Shoe(name: "Yeezy 350", brand: "Adidas", photo: "yzy_static", price: 1500, sizes: [], color: "shoe_gray"),
        Shoe(name: "Yeezy 500", brand: "Adidas", photo: "yzy500_black", price: 2200, sizes: [], color: "shoe_black"),
        Shoe(name: "Air Jordan 1", brand: "Nike", photo: "aj1_pinegreen", price: 2350, sizes: [], color: "shoe_green", description: "Jordan Brand expanded their Black Toe line up with the Jordan 1 Retro High Pine Green, now available on StockX. This design is reminiscent of the Bred Toe release of 2018 only instead of red the toe box and ankle inserts are paneled with pine green hues. \n\nThis Jordan 1 Retro High is composed of a white tumbled leather upper with pine green and black overlays. A black leather Swoosh, sail midsole, and pine green outsole completes this design. These sneakers released in September of 2018 and retailed for $160. "),
        Shoe(name: "Air Jordan 1", brand: "Nike", photo: "aj1_taxi", price: 2350, sizes: [], color: "shoe_yellow", description: "The Air Jordan 1 Retro High OG Yellow Toe brings back the distinct color blocking as well as the sneaker´s high silhouette. This Retro OG Air Jordan 1 comes in an all leather build that combines a white base with a yellow toe box, and some yellow overlays in the heel and ankle area. A contrasting black appears in the toe and lace area, Swoosh, and Wings logo on the lateral side. A classic AJ1 white midsole and a yellow rubber outsole round off the design.\n\nThe Air Jordan 1 Retro High OG Yellow Toe was released on the 24th of September 2022, and retailed for $170."),        
    ]
    
    
}
