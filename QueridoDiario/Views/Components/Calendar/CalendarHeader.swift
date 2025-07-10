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
    
    @Binding var isCalendarExpanded: Bool
    
    

    init(selectedDate: Binding<Date>, isCalendarExpanded: Binding<Bool>, calendarService: CalendarService = .shared) {
        self._selectedDate = selectedDate
        self._isCalendarExpanded = isCalendarExpanded
        self.calendarService = calendarService
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(calendarService.monthName(for: selectedDate))
                    .font(Font.custom("BricolageGrotesque-ExtraBold", size: 24))
                    .foregroundStyle(Color.primary06)
                Spacer()
                Button(action: {
                    isCalendarExpanded.toggle()
                }, label: {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24)
                        .rotationEffect(Angle.degrees(isCalendarExpanded ? 180 : 0))
                        .animation(.easeInOut, value: isCalendarExpanded)
                })
                
            }

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

