//
//  TitleModifier.swift
//  HoneyMoon
//
//  Created by Mohamed Magdy on 07/12/2023.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.pink)
    }
}

