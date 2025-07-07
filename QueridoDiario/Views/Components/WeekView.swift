import SwiftUI

struct WeekView: View {
    @Binding var selectedDate: Date
    private let calendarService = CalendarService.shared

    var body: some View {
        let week = calendarService.currentWeek(for: selectedDate)
        HStack {
            ForEach(week, id: \.self) { day in
                let isCurrentDay = calendarService.calendar.isDate(day, inSameDayAs: selectedDate)
                if isCurrentDay {
                    Text("\(calendarService.calendar.component(.day, from: day))")
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            selectedDate = day
                        }
                        .foregroundStyle(Color.neutrals01)
                        .background(Color.primary04)
                        .clipShape(Circle())
                } else {
                    
                    Text("\(calendarService.calendar.component(.day, from: day))")
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            selectedDate = day
                        }
                }
            }
        }
        .padding()
    }
}
