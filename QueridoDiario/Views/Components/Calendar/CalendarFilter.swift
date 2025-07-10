//
//  CalendarFilter.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 10/07/25.
//

import SwiftUI

struct CalendarFilter: View {
    
    @Binding var selectedDate: Date
    @State var isExpanded: Bool = false
    
    var body: some View {
        
        VStack(spacing: 12) {
            CalendarHeader(selectedDate: $selectedDate, isCalendarExpanded: $isExpanded)
            
            VStack {
                if isExpanded {
                    MonthView(selectedDate: $selectedDate)
                        .transition(.opacity)
                } else {
                    WeekView(selectedDate: $selectedDate)
                        .transition(.opacity)
                }
            }
            .animation(.easeInOut, value: isExpanded)
        }
        .padding([.horizontal, .bottom])
    }
}
