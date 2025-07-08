//
//  CalendarHeader.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 07/07/25.
//

import SwiftUI

struct CalendarHeader: View {
    private let calendarService = CalendarService.shared
    
    @Binding var selectedDate: Date
    
    var body: some View {
        VStack {
            HStack {
                Text(calendarService.monthName(for: selectedDate))
                    .font(Font.custom("BricolageGrotesque-ExtraBold", size: 24))
                    .foregroundStyle(Color.primary06)
                Spacer()
            }
            HStack {
                Text("SAB")
                    .font(Font.custom("BricolageGrotesque-Regular", size: 11))
                    .foregroundStyle(Color.neutrals03)
                    .padding(8)
                Text("DOM")
                    .font(Font.custom("BricolageGrotesque-Regular", size: 11))
                    .foregroundStyle(Color.neutrals03)
                    .padding(8)
                Text("SEG")
                    .font(Font.custom("BricolageGrotesque-Regular", size: 11))
                    .foregroundStyle(Color.neutrals03)
                    .padding(8)
                Text("TER")
                    .font(Font.custom("BricolageGrotesque-Regular", size: 11))
                    .foregroundStyle(Color.neutrals03)
                    .padding(8)
                Text("QUA")
                    .font(Font.custom("BricolageGrotesque-Regular", size: 11))
                    .foregroundStyle(Color.neutrals03)
                    .padding(8)
                Text("QUI")
                    .font(Font.custom("BricolageGrotesque-Regular", size: 11))
                    .foregroundStyle(Color.neutrals03)
                    .padding(8)
                Text("SEX")
                    .font(Font.custom("BricolageGrotesque-Regular", size: 11))
                    .foregroundStyle(Color.neutrals03)
                    .padding(8)
            }
        }
    }
}
