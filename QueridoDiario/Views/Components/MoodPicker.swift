//
//  MoodPicker.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 10/04/25.
//

import SwiftUI

struct MoodPicker: View {
    
    @ObservedObject var viewModel = PageViewModel.shared
    
    @State var isSelected = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        isSelected.toggle()
                    }
                }, label: {
                    VStack {
                        viewModel.mood.emote
                            .resizable()
                            .frame(width: 59.44, height: 59.44)
                        Text("Humor")
                            .font(Font.custom("BricolageGrotesque-ExtraBold", size: 12.39))
                            .foregroundStyle(Color.neutrals04)
                    }
                })
            }
            if isSelected {
                MoodSelectionGrid(isPresented: $isSelected)
                    .transition(.asymmetric(insertion: .push(from: .top), removal: .push(from: .bottom)))
            }
        }
    }
}
