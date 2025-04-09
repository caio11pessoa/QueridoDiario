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
    CustomButton()
}

enum ButtonColor {
    case white
    case lightPurple
    case purple
    
    var background: Color {
        switch self {
        case .white:
            return Color("neutrals_01")
        case .lightPurple:
            return Color("primary_02")
        case .purple:
            return Color("primary_04")
        }
    }
    
    var text: Color {
        switch self {
        case .white:
            return Color("primary_06")
        case .lightPurple:
            return Color("primary_06")
        case .purple:
            return Color("neutrals_01")
            
        }
        
    }
}
    
enum ButtonType {
    case noIcon(String)
    case plusIcon(String, ButtonColor)
    case arrowIcon(String, ButtonColor)
    
    var label: AnyView {
        switch self {
        case .noIcon(let text):
            return AnyView(Text("\(text)")
                .font(Font.custom("BricolageGrotesque-ExtraBold", size: 24)))
        case .plusIcon(let text, let color):
            return AnyView(HStack {
                Text("\(text)")
                    .font(Font.custom("BricolageGrotesque-ExtraBold", size: 24))
                Image("Icon=Plus, State=Select, Bg Fill=\(color == .purple ? "True" : "False")")
            })
        case .arrowIcon(let text, let color):
            return AnyView(HStack {
                Text("\(text)")
                    .font(Font.custom("BricolageGrotesque-ExtraBold", size: 24))
                Image("Icon=Right Arrow, State=Select, Bg Fill=\(color == .purple ? "True" : "False")")
            })
        }
    }
}
