//
//  FiltersTab.swift
//  ShoesShop
//
//  Created by Dominik Kowalewski on 19/02/2023.
//

import SwiftUI

struct FiltersTab: View {
    
    @EnvironmentObject var shoeModel: ShoeModel
    @State var selectedColors: [String] = []
    @State var selectedBrands: [String] = []
    @State private var priceValue = 0.00
    @State private var isEditing = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack (alignment: .leading){
            
            Text("Filters")
                .font(.title)
                .fontWeight(.semibold)
            
            Divider()
            
            HStack {
                Button(role: .destructive) {
                    
                    shoeModel.activeList = shoeModel.shoesList
                    shoeModel.colorsFiltered = false
                    shoeModel.brandsFiltered = false
                    selectedBrands = []
                    selectedColors = []
                    
                } label: {
                    Text("Clear all")
                }
                .padding(.top, 5)
            }
            .hAlign(.trailing)
            
            VStack (alignment: .leading){
                Text("Color")
                    .font(.headline)
                    .padding(.top, 5)
                
                HStack (spacing: 16){
                    
                    ForEach(shoeModel.shoesColors, id: \.self) { color in
                        ZStack {
                            Circle()
                                .fill(selectedColors.contains(color) ? .gray : .white )
                                .frame(width: 30, height: 30)
                            
                            Circle()
                                .fill(.white)
                                .frame(width: 25, height: 25)
                            
                            Circle()
                                .fill(Color(color))
                                .frame(width: 20, height: 20)
                                .shadow(radius: 2)
                            
                        }
                        .animation(.easeIn, value: selectedColors)
                        .onTapGesture {
                            if selectedColors.contains(color) {
                                selectedColors = selectedColors.filter { $0 != color }
                            } else {
                                selectedColors.append(color)
                            }
                        }
                    }
                }
                .padding(.top, 4)
                Divider()
            }
            
            VStack (alignment: .leading) {
                Text("Price")
                    .font(.headline)
                    .padding(.top)
                
                Divider()
            }
            
            VStack (alignment: .leading) {
                Text("Brand")
                    .font(.headline)
                    .padding(.top)
                
                HStack (spacing: 16) {
                    ForEach(shoeModel.brandList, id: \.self) { brand in
                        ZStack {
                            Text(brand)
                                .foregroundColor(selectedBrands.contains(brand) ? .black : .gray)
                            
                            if selectedBrands.contains(brand) {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 20, height: 3)
                                    .offset(y: 15)
                            }
                        }
                        .animation(.easeIn, value: selectedBrands)
                        .onTapGesture {
                            if selectedBrands.contains(brand) {
                                selectedBrands = selectedBrands.filter { $0 != brand }
                            } else {
                                selectedBrands.append(brand)
                            }
                        }
                    }
                }
                .padding(.top, 4)
            }
            
            Button {
                if selectedColors.isEmpty && selectedBrands.isEmpty {
                    shoeModel.activeList = []
                    dismiss()
                } else {
                    shoeModel.activeList = shoeModel.filterShoes(shoeModel.shoesList, colors: selectedColors, brands: selectedBrands)
                    dismiss()
                }
            } label: {
                Text("Apply")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 200)
                        .frame(height: 45)
                    )
                    .foregroundColor(.white)
            }
            .hAlign(.center)
            .vAlign(.bottom)

            
        }
        .hAlign(.leading)
        .vAlign(.top)
        .padding()
        .onAppear {
            if shoeModel.brandsFiltered {
                selectedBrands = shoeModel.fetchBrands(shoeModel.activeList)

            }
            if shoeModel.colorsFiltered {
                selectedColors = shoeModel.fetchColors(shoeModel.activeList)
            }
        }
        
    }
}

struct FiltersTab_Previews: PreviewProvider {
    static var previews: some View {
        FiltersTab()
            .environmentObject(ShoeModel())
    }
}
