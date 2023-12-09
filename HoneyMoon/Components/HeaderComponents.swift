//
//  HeaderComponents.swift
//  HoneyMoon
//
//  Created by Mohamed Magdy on 04/12/2023.
//

import SwiftUI

struct HeaderComponents: View {
    var body: some View {
        
        VStack {
            Capsule()
                .frame(width: 150 ,height: 10)
                .foregroundStyle(.secondary)
                .opacity(0.2)
            
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
        }
    }
}

#Preview {
    HeaderComponents()
        .previewLayout(.fixed(width: 375, height: 128))
}
