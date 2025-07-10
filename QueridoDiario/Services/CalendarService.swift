//
//  CalendarService.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 12/05/25.
//

import Foundation

class CalendarService {
    static let shared = CalendarService()
    let calendar = Calendar.current

    /// Retorna o nome do mês no formato local (ex: "Julho")
    func monthName(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "LLLL"
        return formatter.string(from: date).capitalized
    }

    /// Retorna true se a data passada está no mesmo mês e ano da referência
    func isDayInCurrentMonth(_ day: Date, for referenceDate: Date) -> Bool {
        let dayComponents = calendar.dateComponents([.year, .month], from: day)
        let referenceComponents = calendar.dateComponents([.year, .month], from: referenceDate)
        return dayComponents.year == referenceComponents.year &&
               dayComponents.month == referenceComponents.month
    }

    /// Retorna um array de 6 semanas completas, cada uma com 7 dias (`[[Date]]`)
    func completeWeeks(for date: Date) -> [[Date]] {
        let components = calendar.dateComponents([.year, .month], from: date)
        guard let firstOfMonth = calendar.date(from: components) else { return [] }

        let weekday = calendar.component(.weekday, from: firstOfMonth)
        let daysBefore = weekday - calendar.firstWeekday
        let startOffset = daysBefore >= 0 ? daysBefore : 7 + daysBefore

        guard let startDate = calendar.date(byAdding: .day, value: -startOffset, to: firstOfMonth) else { return [] }

        var weeks: [[Date]] = []
        var currentWeek: [Date] = []

        for i in 0..<42 { // 6 semanas completas (6x7)
            if let day = calendar.date(byAdding: .day, value: i, to: startDate) {
                currentWeek.append(day)
                if currentWeek.count == 7 {
                    weeks.append(currentWeek)
                    currentWeek = []
                }
            }
        }

        return weeks
    }

    /// Retorna os 7 dias da semana atual da data informada
    func currentWeek(for date: Date) -> [Date] {
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: date) else { return [] }
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: weekInterval.start) }
    }
}
