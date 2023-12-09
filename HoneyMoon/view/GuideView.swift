//
//  GuideView.swift
//  HoneyMoon
//
//  Created by Mohamed Magdy on 04/12/2023.
//

import SwiftUI

struct GuideView: View {
    
    // MARK: - properties
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false) {
            VStack(alignment: .center,spacing: 20)
            {
                HeaderComponents()
                
                Spacer(minLength: 10)
                
                Text("get started!".uppercased())
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                Text("discover and pick the perfect distination for your romantic honeymoon! ")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack(alignment: .leading,spacing: 25){
               
                    GuideComponents(
                      title: "Like",
                      subTitle: "Swipe right",
                      description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favourites.",
                      icon: "heart.circle")
                    
                    GuideComponents(
                      title: "Dismiss",
                      subTitle: "Swipe left",
                      description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.",
                      icon: "xmark.circle")
                    
                    GuideComponents(
                      title: "Book",
                      subTitle: "Tap the button",
                      description: "Our selection of honeymoon resorts is perfect setting for you to embark your new life together.",
                      icon: "checkmark.square")
                }
                
                Spacer(minLength: 10)
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("continue".uppercased())
                        .modifier(ButtonModifier())
                })
                
            }
            .frame(minWidth: 0,maxWidth: .infinity)
            .padding(.top,15)
            .padding(.bottom,25)
            .padding(.horizontal,25)
        }
       
    }
}

#Preview {
    GuideView()
}
