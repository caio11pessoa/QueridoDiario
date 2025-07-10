//
//  DayView.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 10/07/25.
//

import SwiftUI

struct DayView: View {
    let date: Date
    let isSelected: Bool
    let isInCurrentMonth: Bool
    let onSelect: () -> Void

    var body: some View {
        let day = Calendar.current.component(.day, from: date)

        Text("\(day)")
            .frame(maxWidth: .infinity)
            .foregroundStyle(isSelected ? Color.neutrals01 : .primary)
            .padding(8)
            .background(isSelected ? Color.primary04 : Color.clear)
            .clipShape(Circle())
            .contentShape(Circle()) // Improves tap area
            .onTapGesture {
                if isInCurrentMonth {
                    onSelect()
                }
            }
            .accessibilityLabel("Dia \(day)")
            .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}

