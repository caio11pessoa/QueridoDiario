//
//  CustomButton.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 07/04/25.
//

import SwiftUI

struct CustomButton: View {
    
    var action: () -> Void = {}
    
    var buttonColor: ButtonColor = .lightPurple
    
    var buttonStyle: ButtonType = .plusIcon("Ação", .lightPurple)
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Spacer()
                buttonStyle.label
                    .padding(.vertical, 8)
                Spacer()
            }
        })
        .background(buttonColor.background)
        .cornerRadius(8)
        .foregroundStyle(buttonColor.text)
        .padding()
    }
}

#Preview {
    CustomButton(buttonColor: .purple)
    CustomButton(buttonColor: .white)
    CustomButton(buttonColor: .lightPurple)
    
}

enum ButtonColor {
    case white
    case lightPurple
    case purple
    
    var background: Color {
        switch self {
        case .white:
            return Color(.neutrals01)
        case .lightPurple:
            return Color(.primary02)
        case .purple:
            return Color(.primary04)
        }
    }
    
    var text: Color {
        switch self {
        case .white:
            return Color(.primary06)
        case .lightPurple:
            return Color(.primary06)
        case .purple:
            return Color(.neutrals01)
            
        }
        
    }
}

enum ButtonType {
    case noIcon(String)
    case plusIcon(String, ButtonColor)
    case arrowIcon(String, ButtonColor)
    
    private struct LabelView: View {
        let text: String
        var imageName: String?
        
        var body: some View {
            HStack {
                Text(text)
                    .font(.custom("BricolageGrotesque-ExtraBold", size: 24))
                if let imageName = imageName {
                    Image(imageName)
                }
            }
        }
    }
    
    
    var label: some View {
        switch self {
        case .noIcon(let text):
            LabelView(text: text)

        case .plusIcon(let text, let color):
            LabelView(text: text, imageName: "Icon=Plus, State=Select, Bg Fill=\(color == .purple ? "True" : "False")")

        case .arrowIcon(let text, let color):
            LabelView(text: text, imageName: "Icon=Right Arrow, State=Select, Bg Fill=\(color == .purple ? "True" : "False")")
        }
    }
}
