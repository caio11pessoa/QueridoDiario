//
//  MoodSelectionGrid.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 09/04/25.
//

import SwiftUI

struct MoodSelectionGrid: View {
    
    let moodOptions = Mood.allCases.dropLast()
    
    @Binding var isPresented: Bool

    var body: some View {
        let columns = [
            GridItem(.adaptive(minimum: 70))
        ]

        VStack {
            HStack {
                Text("Stickers")
                    .font(Font.custom("BricolageGrotesque-SemiBold", size: 14.5))
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(.iconCloseStateSelectBgFillFalse)
                })
            }
            .padding()
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(moodOptions, id: \.self) { mood in
                    MoodOption(mood: mood)
                }
            }
            .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.neutrals01)
                .stroke(Color.primary02, lineWidth: 1))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MoodSelectionGrid(isPresented: .constant(true))
}
