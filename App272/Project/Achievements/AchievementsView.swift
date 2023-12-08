//
//  AchievementsView.swift
//  App272
//
//  Created by Вячеслав on 12/7/23.
//

import SwiftUI

struct AchievementsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Achievements")
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .medium))
                    .padding()
                
                VStack(alignment: .center, spacing: 13, content: {
                    
                    Image(systemName: "list.bullet.clipboard")
                        .foregroundColor(.gray)
                        .font(.system(size: 26, weight: .semibold))
                    
                    Text("You need to have 10 investments to\nunlock access to the achievements")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center)
                })
                .frame(maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    AchievementsView()
}
