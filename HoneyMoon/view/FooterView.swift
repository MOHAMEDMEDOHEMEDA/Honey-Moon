//
//  FooterView.swift
//  HoneyMoon
//
//  Created by Mohamed Magdy on 04/12/2023.
//

import SwiftUI

struct FooterView: View {
    // MARK: - properties
    
    @Binding var showBookingAlert : Bool
    let haptic = UINotificationFeedbackGenerator()
    
    
    var body: some View {
        
        HStack {
            Button(action: {
                PlaySound(sound: "sound-click", type: "mp3")
            }, label: {
                Image(systemName: "xmark.circle")
                    .tint(.primary)
            })
            .font(.system(size: 45,weight: .light))
            Spacer()
            
            Button(action: {
                PlaySound(sound: "sound-click", type: "mp3")
                self.haptic.notificationOccurred(.success)
                self.showBookingAlert.toggle()
            }, label: {
                
                Text("book destination".uppercased())
                    .font(.system(.subheadline,design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal,18)
                    .padding(.vertical,11)
                    .tint(.pink)
                    .background(Capsule().stroke(Color.pink, lineWidth: 2))
            })
            Spacer()
            Button(action: {
                PlaySound(sound: "sound-click", type: "mp3")
            }, label: {
                Image(systemName: "heart.circle")
                    .tint(.primary)
            })
            .font(.system(size: 45,weight: .light))
            
        }
        .padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    @State static var showAlert: Bool = false
    
    static var previews: some View {
        FooterView(showBookingAlert: $showAlert)
            .previewLayout(.sizeThatFits)
    }
}

