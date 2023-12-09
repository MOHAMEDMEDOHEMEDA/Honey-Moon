//
//  InfoView.swift
//  HoneyMoon
//
//  Created by Mohamed Magdy on 07/12/2023.
//

import SwiftUI

struct InfoView: View {
    
    // MARK: - properties
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center,spacing: 20, content: {
                HeaderComponents()
                
                
                Spacer(minLength: 10)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditsView()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()                }, label: {
                    Text("continue".uppercased())
                        .modifier(ButtonModifier())
                })
                
            })
            .frame(minWidth: 0,maxWidth: .infinity)
            .padding(.top,15)
            .padding(.bottom,25)
            .padding(.horizontal,25)
        })
        
    }
}

#Preview {
    InfoView()
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10)
        {
            RowAppInfoView(itemOne: "Application", itemTwo: "Honeymoon")
            RowAppInfoView(itemOne: "compatibility", itemTwo: "iphone and ipad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "Mohamed Magdy")
            RowAppInfoView(itemOne: "Designer", itemTwo: "Robert patras")
            RowAppInfoView(itemOne: "website", itemTwo: "swiftuiMasterclass.com")
            RowAppInfoView(itemOne: "Version", itemTwo: "1.0.0")
            
        }
    }
}

struct RowAppInfoView: View {
    // MARK: - properties
    var itemOne : String
    var itemTwo : String
    
    var body: some View {
        VStack {
            HStack{
                Text(itemOne).foregroundStyle(.gray)
                Spacer()
                Text(itemTwo)
            }
            Divider()
        }
    }
}

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            HStack{
                Text("Photos").foregroundStyle(.gray)
                Spacer()
                Text("Unsplash")
            }
            Divider()
            
            Text("Photographers").foregroundStyle(.gray)
            
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .multilineTextAlignment(.leading)
                .font(.footnote)
                
        }
    }
}
