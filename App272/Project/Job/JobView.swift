//
//  JobView.swift
//  App272
//
//  Created by Вячеслав on 12/7/23.
//

import SwiftUI

struct JobView: View {
    
    @StateObject var viewModel = JobViewModel()
    
    @AppStorage("money") var money: Int = 10000
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Job")
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .medium))
                    .padding()
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        Text("Investment")
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
                        
                        Text("Amount")
                            .foregroundColor(.white.opacity(0.5))
                            .font(.system(size: 13, weight: .regular))
                        
                        Text("\(viewModel.currencies.count) currencies")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.orange))
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    Text("Portfolio")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                    if viewModel.currencies.isEmpty {
                        
                        VStack(alignment: .center, spacing: 13, content: {
                            
                            Image(systemName: "list.bullet.clipboard")
                                .foregroundColor(.gray)
                                .font(.system(size: 26, weight: .semibold))
                            
                            Text("You don't have any purchased\ncurrency")
                                .foregroundColor(.gray)
                                .font(.system(size: 18, weight: .semibold))
                                .multilineTextAlignment(.center)
                        })
                        .frame(maxHeight: .infinity, alignment: .center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.currencies, id: \.self) { index in
                                    
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
                .padding()
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.isAdd = true
                    
                }, label: {
                    
                    Text("Buy Currency")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.purple))
                        .padding()
                })
            }
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            JobAdd()
        })
    }
}

#Preview {
    JobView()
}
