//
//  PropertyView.swift
//  App272
//
//  Created by Вячеслав on 12/7/23.
//

import SwiftUI

struct PropertyView: View {
    
    @AppStorage("money") var money: Int = 10000
    @AppStorage("bought_items") var bought_items: [String] = []
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Property")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Text("$\(money)")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                    }
                }
                .padding()
                
                Text("Market")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .medium))
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                    .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        ForEach(["Apartment", "Car", "Laptop", "Phone", "Game Console", "Watch"], id: \.self) { index in
                            
                            Button(action: {
                                
                                if !bought_items.contains(index) {
                                    
                                    bought_items.append(index)
                                    money -= 1500
                                }
                                
                            }, label: {
                                
                                VStack {
                                    
                                    Image(index)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 55, height: 55)
                                    
                                    VStack(alignment: .center, spacing: 5, content: {
                                        
                                        Text(index)
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                        
                                        Text(bought_items.contains(index) ? "Bought" : "$\(1500)")
                                            .foregroundColor(Color("primary"))
                                            .font(.system(size: 13, weight: .regular))
                                    })
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(bought_items.contains(index) ? Color("primary") : .gray.opacity(0.4)))
                            })
                        }
                    })
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    PropertyView()
}
