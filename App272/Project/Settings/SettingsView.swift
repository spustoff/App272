//
//  SettingsView.swift
//  App272
//
//  Created by Вячеслав on 12/7/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @AppStorage("money") var money: Int = 10000
    @AppStorage("currencies") var currencies: [String] = []
    @AppStorage("bought_items") var bought_items: [String] = []
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .medium))
                    .padding()
                
                Button(action: {
                    
                    guard let url = URL(string: "https://docs.google.com/document/d/1W7wo_P--2GtOY3cHTHvnosqSI0EvDLGIq0HijhBEy6s/edit?usp=sharing") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Usage Policy")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Rate Us")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    bought_items = []
                    currencies = []
                    money = 10000
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "trash.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Reset Data")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    .padding(.horizontal)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
