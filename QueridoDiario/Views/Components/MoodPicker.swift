//
//  MoodPicker.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 10/04/25.
//

import SwiftUI

struct MoodPicker: View {
    
    var mood: Mood = Mood.empty
    
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action, label: {
            VStack {
                mood.emote
                    .resizable()
                    .frame(width: 59.44, height: 59.44)
                Text("Humor")
                    .font(Font.custom("BricolageGrotesque-ExtraBold", size: 12.39))
                    .foregroundStyle(Color.neutrals04)
            }
        })
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MoodPicker()
}
