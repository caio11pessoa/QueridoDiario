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
            mood.emote
                .resizable()
                .frame(width: 59.44, height: 59.44)
        })
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MoodPicker()
}
