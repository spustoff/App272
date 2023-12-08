//
//  JobAdd.swift
//  App272
//
//  Created by Вячеслав on 12/7/23.
//

import SwiftUI

struct JobAdd: View {
    
    @Environment(\.presentationMode) var router
    
    @State var pair: String = "EURUSD"
    @State var timeframe: String = "1M"
    
    @AppStorage("currencies") var currencies: [String] = []
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.5))
                    .frame(width: 60, height: 4)
                
                Text(pair)
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .medium))
                    .padding()
                
                HStack {
                    
                    Text("\(Int.random(in: 1...25005))")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Text("-\(Int.random(in: 1...24))%")
                        .foregroundColor(.red)
                        .font(.system(size: 13, weight: .regular))
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.red.opacity(0.2)))
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    
                    ForEach(["1M", "5M", "15M", "1H"], id: \.self) { index in
                 
                        Button(action: {
                            
                            timeframe = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(timeframe == index ? .white : .black)
                                .font(.system(size: 14, weight: .medium))
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")).opacity(timeframe == index ? 1 : 0))
                        })
                    }
                }
                .padding(.horizontal)
                
                Image("graph")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 20, content: {
                    
                    Menu {
                        
                        ForEach(["EURUSD", "EURTRY", "EURKZT", "EURCAD", "EURUAH"], id: \.self) { index in
                                
                            Button(action: {
                                
                                pair = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                    
                                    Spacer()
                                    
                                    if pair == index {
                                        
                                        Image(systemName: "xmark")
                                    }
                                }
                            })
                        }
                        
                    } label: {
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Currency")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            Text("\(pair)")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        
                        Button(action: {
                            
                            if !currencies.contains(pair) {
                                
                                currencies.append(pair)
                            }
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("BUY")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                        })
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("CLOSE")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                        })
                    }
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.4)))
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    JobAdd()
}
