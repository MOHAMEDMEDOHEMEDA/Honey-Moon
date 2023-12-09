//
//  SympolModifier.swift
//  HoneyMoon
//
//  Created by Mohamed Magdy on 09/12/2023.
//

import SwiftUI

struct SympolModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.system(size: 128))
            .shadow(color: .black, radius: 12, x: 0, y: 0)
    }
}


