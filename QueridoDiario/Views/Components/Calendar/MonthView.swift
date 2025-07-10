//
//  MonthView.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 12/05/25.
//

import SwiftUI

struct MonthView: View {
    @Binding var selectedDate: Date
    private let calendarService: CalendarService

    init(selectedDate: Binding<Date>, calendarService: CalendarService = .shared) {
        self._selectedDate = selectedDate
        self.calendarService = calendarService
    }

    var body: some View {
        let weeks = calendarService.completeWeeks(for: selectedDate)
        
        ForEach(weeks, id: \.self) { week in
            HStack(spacing: 0) {
                ForEach(week, id: \.self) { date in
                    let isCurrentMonth = calendarService.isDayInCurrentMonth(date, for: selectedDate)
                    let isSelected = Calendar.current.isDate(date, inSameDayAs: selectedDate)

                    DayView(
                        date: date,
                        isSelected: isSelected,
                        isInCurrentMonth: isCurrentMonth
                    ) {
                        selectedDate = date
                    }
                }
            }
        }
    }
}
