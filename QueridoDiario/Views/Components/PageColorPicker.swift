//
//  PageColorPicker.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 07/04/25.
//

import SwiftUI

struct PageColorPicker: View {
    
    @State var selectedColor: PageColor = .white
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Cores")
                    .font(Font.custom("BricolageGrotesque-SemiBold", size: 14.5))
                Spacer()
                Image(.iconCloseStateSelectBgFillFalse)
                    .onTapGesture {
                        isPresented = false
                    }
            }
            
            HStack {
                RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                    .fill(selectedColor.selected)
                    .frame(maxWidth: 60, maxHeight: 60)
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                            .stroke(Color(.primary02), lineWidth: selectedColor == PageColor.white ? 2 : 0)
                    )
                Spacer()
                ColorOption(selectedColor: $selectedColor, color: PageColor.blue)
                Spacer()
                ColorOption(selectedColor: $selectedColor, color: PageColor.pink)
                Spacer()
                ColorOption(selectedColor: $selectedColor, color: PageColor.purple)
                Spacer()
                ColorOption(selectedColor: $selectedColor, color: PageColor.green)
                Spacer()
                ColorOption(selectedColor: $selectedColor, color: PageColor.white)
            }
        }
        .frame(maxHeight: 128)
        .padding()
        .background(
            RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                .stroke(Color(.primary02), lineWidth: 1))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PageColorPicker(isPresented: .constant(true))
}

struct ColorOption: View {
    
    @Binding var selectedColor: PageColor
    
    var color: PageColor
    
    var body: some View {
        Button(action: {
            selectedColor = color
        }, label: {
            Circle()
                .fill(color.selected)
                .frame(maxWidth: 30, maxHeight: 30)
                .overlay(
                    Circle()
                        .stroke(Color(.primary02), lineWidth: color == PageColor.white ? 2 : 0)
                )
        })
    }
}
