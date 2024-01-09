//
//  TabBarbutton.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/9/24.
//

import SwiftUI

struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    
    var body: some View {
        Text(text)
            .fontWeight(isSelected ? .heavy : .regular)
            .font(.custom("Avenir", size: 16))
            .underline(isSelected, pattern: .solid, color: isSelected ? .black : .clear)
            .baselineOffset(10)
    }
}

#Preview {
    TabBarButton(text: "", isSelected: .constant(true))
}
