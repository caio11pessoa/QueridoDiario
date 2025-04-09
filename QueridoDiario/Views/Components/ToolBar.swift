//
//  ToolBar.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 08/04/25.
//

import SwiftUI

struct ToolBar: View {
    
    @ObservedObject var screen = DeviceDimensions.shared
    
    @State var isSelected = false
    
    var action: () -> Void = {}
    
    var body: some View {
        VStack(alignment: .trailing) {
            if isSelected {
                PageColorPicker()
            }
                
            HStack {
                Spacer()
                HStack {
                    Button(action: {
                        action()
                        withAnimation {
                            isSelected.toggle()
                        }
                    }, label: {
                        Image(isSelected ? "Icon=Paint, State=Default, Bg Fill=True" : "Icon=Paint, State=Default, Bg Fill=False")
                            .resizable()
                            .frame(width: 44, height: 44)
                    })
                    .padding()
                }
                .background(Color("neutrals_01"))
                .frame(width: 84, height: 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("primary_02"), lineWidth: 1)
                )
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ToolBar()
}
