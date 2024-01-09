//
//  CustomTopTabBar.swift
//  UnForgettably_Coin
//
//  Created by 염성필 on 1/9/24.
//

import SwiftUI

struct CustomTopTabBar: View {
    @Binding var tabIndex: Int
    var body: some View {
        HStack(spacing: 20) {
            TabBarButton(text: "원화", isSelected: .constant(tabIndex == 0))
                .onTapGesture {
                 onButtonTapped(index: 0)
                    print("원화 눌림")
                }
            TabBarButton(text: "비트코인", isSelected: .constant(tabIndex == 1))
                .onTapGesture {
                    onButtonTapped(index: 1)
                    print("비트 코인 눌림")
                }
            Spacer()
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation(.easeInOut.speed(1.6)) { tabIndex = index }
    }
}

#Preview {
    CustomTopTabBar(tabIndex: .constant(1))
}
