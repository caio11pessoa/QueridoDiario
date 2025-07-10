//
//  CalendarHeader.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 07/07/25.
//

import SwiftUI

struct CalendarHeader: View {
    private let weekDays = ["DOM", "SEG", "TER", "QUA", "QUI", "SEX", "SAB"]
    private let calendarService: CalendarService
    @Binding var selectedDate: Date

    init(selectedDate: Binding<Date>, calendarService: CalendarService = .shared) {
        self._selectedDate = selectedDate
        self.calendarService = calendarService
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(calendarService.monthName(for: selectedDate))
                .font(Font.custom("BricolageGrotesque-ExtraBold", size: 24))
                .foregroundStyle(Color.primary06)

            HStack {
                ForEach(weekDays, id: \.self) { day in
                    Text(day)
                        .font(Font.custom("BricolageGrotesque-Regular", size: 11))
                        .foregroundStyle(Color.neutrals03)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
            }
        }
    }
}

