//
//  SwiftUIView.swift
//  HoneyMoon
//
//  Created by Mohamed Magdy on 03/12/2023.
//

import SwiftUI

struct HeaderView: View {
    
    // MARK: - properties
    
    @Binding var showGuideView : Bool
    @Binding var showInfoView : Bool
    let haptic = UINotificationFeedbackGenerator()

    
    
    var body: some View {
        
        
        
        HStack {
            Button(action: {
                PlaySound(sound: "sound-click", type: "mp3")
                self.haptic.notificationOccurred(.success)
                self.showInfoView.toggle()
                
            }) {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            
            .accentColor(Color.primary)
            .sheet(isPresented: $showInfoView){
                InfoView()
            }
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            Button(action: {
                PlaySound(sound: "sound-click", type: "mp3")
                self.haptic.notificationOccurred(.success)
                self.showGuideView.toggle()
            }) {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            
            .accentColor(Color.primary)
            .sheet(isPresented: $showGuideView, content: {
                GuideView()
            })
            
            
            
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var showGuide : Bool = false
    @State static var showInfo : Bool = false

    static var previews: some View {
        HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}


