//
//  HomeView.swift
//  App272
//
//  Created by Вячеслав on 12/7/23.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("money") var money: Int = 10000
    
    @AppStorage("currencies") var currencies: [String] = []
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Home")
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .medium))
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 8, content: {
                                
                                Text("Your level")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("Bronze 1")
                                    .foregroundColor(.white)
                                    .font(.system(size: 21, weight: .semibold))
                                
                                Text("\(money)/50.000 $")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                            })
                            
                            Spacer()
                            
                            Image("bronze")
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.purple))
                        .padding(.horizontal)
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Balance")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("$\(money)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.orange))
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Job")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("Bank Teller")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.orange))
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Overview")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .medium))
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 15) {
                                    
                                    HStack {
                                        
                                        Image(systemName: "arrow.up")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12, weight: .bold))
                                            .frame(width: 30, height: 30)
                                            .background(Circle().fill(.green))
                                        
                                        Spacer()
                                        
                                        Text("+\(32)%")
                                            .foregroundColor(.green)
                                            .font(.system(size: 11, weight: .regular))
                                            .padding(6)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 6, content: {
                                        
                                        Text("Profit")
                                            .foregroundColor(.black.opacity(0.6))
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text("+ $\(0)")
                                            .foregroundColor(.black)
                                            .font(.system(size: 17, weight: .medium))
                                    })
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.4)))
                                
                                VStack(alignment: .leading, spacing: 15) {
                                    
                                    HStack {
                                        
                                        Image(systemName: "arrow.down")
                                            .foregroundColor(.white)
                                            .font(.system(size: 12, weight: .bold))
                                            .frame(width: 30, height: 30)
                                            .background(Circle().fill(.red))
                                        
                                        Spacer()
                                        
                                        Text("+\(32)%")
                                            .foregroundColor(.red)
                                            .font(.system(size: 11, weight: .regular))
                                            .padding(6)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 6, content: {
                                        
                                        Text("Spending")
                                            .foregroundColor(.black.opacity(0.6))
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text("- $\(0)")
                                            .foregroundColor(.black)
                                            .font(.system(size: 17, weight: .medium))
                                    })
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.4)))
                            }
                        })
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Portfolio")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .medium))
                            
                            if currencies.isEmpty {
                                
                                VStack(alignment: .center, spacing: 13, content: {
                                    
                                    Image(systemName: "list.bullet.clipboard")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 26, weight: .semibold))
                                    
                                    Text("You don't have any purchased\ncurrency")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .semibold))
                                        .multilineTextAlignment(.center)
                                })
                                .padding(.vertical, 50)
                                .frame(maxWidth: .infinity, alignment: .center)
                                
                            } else {
                                
                                ScrollView(.vertical, showsIndicators: false) {
                                    
                                    LazyVStack {
                                        
                                        ForEach(currencies, id: \.self) { index in
                                            
                                            HStack {
                                                
                                                VStack(alignment: .leading, spacing: 5, content: {
                                                    
                                                    Text(index)
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 15, weight: .medium))
                                                    
                                                    Text("Default currency")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 13, weight: .regular))
                                                })
                                                
                                                Spacer()
                                                
                                                VStack(alignment: .trailing, spacing: 5, content: {
                                                    
                                                    Text("\(Int.random(in: 1...25543))")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 15, weight: .medium))
                                                    
                                                    Text("-\(Int.random(in: 1...5))$ (\(Int.random(in: 1...30))%)")
                                                        .foregroundColor(.red)
                                                        .font(.system(size: 13, weight: .regular))
                                                })
                                            }
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.4)))
                                        }
                                    }
                                    .padding(1)
                                }
                            }
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
