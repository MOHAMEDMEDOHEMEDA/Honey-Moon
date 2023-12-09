//
//  GuideComponents.swift
//  HoneyMoon
//
//  Created by Mohamed Magdy on 04/12/2023.
//

import SwiftUI

struct GuideComponents: View {
    // MARK: - properties
    let title : String
    let subTitle : String
    let description : String
    let icon : String
    
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 20, content: {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.pink)
            
            VStack(alignment: .leading, spacing:
                    5, content: {
                HStack( content: {
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                    Text(subTitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                })
                .padding(.bottom,4)
                
                Text(description)
                    .font(.footnote)
                    .tint(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                
                
            })
        })
    }
}

#Preview {
    GuideComponents(title: "title", subTitle: "swipe right", description: "Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!", icon: "heart.circle")
        .previewLayout(.sizeThatFits)
}
