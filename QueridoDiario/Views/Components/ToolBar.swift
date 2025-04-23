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
            Spacer()
            if isSelected {
                PageColorPicker(isPresented: $isSelected)
                    .transition(
                        .asymmetric(
                            insertion: .push(from: .bottom),
                            removal: .push(from: .top))
                    ).background(Color.neutrals01)
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
                        Image(isSelected ? .iconPaintStateDefaultBgFillTrue : .iconPaintStateDefaultBgFillFalse)
                            .resizable()
                            .frame(width: 44, height: 44)
                    })
                    .padding()
                }
                .background(Color(.neutrals01))
                .frame(width: 84, height: 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(.primary02), lineWidth: 1)
                )
            }
        }
    }
}

//#Preview(traits: .sizeThatFitsLayout) {
//    ToolBar()
//        .ignoresSafeArea()
//        .padding()
//}
