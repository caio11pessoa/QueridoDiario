//
//  MonthView.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 12/05/25.
//

import SwiftUI

struct MonthView: View {
    @Binding var selectedDate: Date
    private let calendarService = CalendarService.shared

    var body: some View {
        let weeks = calendarService.completeWeeks(for: selectedDate)
        let selectedDayOfMonth = Calendar.current.component(.day, from: selectedDate)
        VStack {
            ForEach(weeks, id: \.self) { week in
                HStack {
                    ForEach(week, id: \.self) { day in
                        let isCurrentMonth = calendarService.isDayInCurrentMonth(day, for: selectedDate)
                        if day == selectedDayOfMonth && isCurrentMonth {
                            Text("\(day)")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.primary04)
                                .clipShape(Circle())
                                .onTapGesture {
                                    selectedDate = calendarService.dateFromDay(day, in: selectedDate)
                                }
                        } else {
                            Text("\(day)")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(isCurrentMonth ? .primary : .gray)
                                .onTapGesture {
                                    if isCurrentMonth {
                                        selectedDate = calendarService.dateFromDay(day, in: selectedDate)
                                    }
                                }
                        }
                    }
                }
            }
        }
        .padding()
    }
}
