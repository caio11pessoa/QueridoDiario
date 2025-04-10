//
//  RoundedTabBar.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 08/04/25.
//

import SwiftUI

struct RoundedTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            tabBarItem(index: 0, imageName: selectedTab == 0 ? "Icon=Home, State=Select, Bg Fill=False" : "Icon=Home, State=Default, Bg Fill=False", label: "Início")
            tabBarItem(index: 1, imageName: selectedTab == 1 ? "Icon=Diario, State=Select, Bg Fill=False" : "Icon=Diario, State=Default, Bg Fill=False", label: "Diário")
            tabBarItem(index: 2, imageName: selectedTab == 2 ? "Icon=Config, State=Select, Bg Fill=False" : "Icon=Config, State=Default, Bg Fill=False", label: "Ajustes")
        }
        .padding(.vertical, 24)
        .background(
            RoundedCorner(radius: 24, corners: [.topLeft, .topRight])
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedCorner(radius: 24, corners: [.topLeft, .topRight])
                        .stroke(Color(.primary02), lineWidth: 1)
                )
        )
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func tabBarItem(index: Int, imageName: String, label: String) -> some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack(spacing: 4) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 44)
                Text(label)
                    .font(
                        Font.custom(index == selectedTab ? "BricolageGrotesque-ExtraBold" : "BricolageGrotesque-Regular", size: 17)
                    )
                    .foregroundColor(Color(.primary06))
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = 16
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
