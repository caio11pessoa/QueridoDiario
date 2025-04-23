//
//  MoodOption.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 09/04/25.
//

import SwiftUI

struct MoodOption: View {
    
    var mood: Mood
    
    @Binding var selectedMood: Mood
    
    var body: some View {
        Button(action: {
            selectedMood = mood
        }, label: {
            ZStack {
                Circle()
                    .fill(Color("primary_02"))
                    .frame(width: 63, height: 63)
                mood.emote
                    .resizable()
                    .frame(width: 51.31, height: 51.31)
            }
        })
    }
}

//#Preview(traits: .sizeThatFitsLayout) {
//    MoodOption()
//}
