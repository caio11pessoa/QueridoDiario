import SwiftUI

import SwiftUI

struct WeekView: View {
    @Binding var selectedDate: Date
    private let calendarService = CalendarService.shared

    var body: some View {
        let week = calendarService.currentWeek(for: selectedDate)

        VStack(spacing: 12) {
            CalendarHeader(selectedDate: $selectedDate, calendarService: calendarService)

            HStack(spacing: 0) {
                ForEach(week, id: \.self) { day in
                    let isSelected = calendarService.calendar.isDate(day, inSameDayAs: selectedDate)
                    let isInCurrentMonth = calendarService.isDayInCurrentMonth(day, for: selectedDate)

                    DayView(
                        date: day,
                        isSelected: isSelected,
                        isInCurrentMonth: isInCurrentMonth
                    ) {
                        selectedDate = day
                    }
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

