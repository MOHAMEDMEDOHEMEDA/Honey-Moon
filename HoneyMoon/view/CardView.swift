//
//  CardView.swift
//  HoneyMoon
//
//  Created by Mohamed Magdy on 02/12/2023.
//

import SwiftUI

struct CardView: View ,Identifiable{
    // MARK: - properties
    let id = UUID()
    let honeyMoon : Destination
    
    var body: some View {
        Image(honeyMoon.image)
            .resizable()
            .cornerRadius(24)
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 12, content: {
                    Text(honeyMoon.place)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal, 18)
                        .padding(.vertical,4)
                        .overlay(
                        Rectangle()
                            .fill(.white)
                            .frame(height: 1)
                        ,alignment: .bottom
                        )
                    Text(honeyMoon.country)
                        .foregroundColor(.black)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(minWidth: 85)
                        .padding(.horizontal, 10)
                        .padding(.vertical,5)
                        .background(
                            Capsule().fill(Color.white)
                        )
                    
                })
                .frame(minWidth: 280)
                .padding(.bottom , 50),
                alignment: .bottom
               
            )
        

    }
}

#Preview {
    CardView(honeyMoon: honeyMoonData[0])
        .previewLayout(.fixed(width: 375, height: 600))
        
}
