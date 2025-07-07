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

    func daysInMonth(for date: Date) -> Int {
        calendar.range(of: .day, in: .month, for: date)?.count ?? 0
    }

    func firstWeekdayOfMonth(for date: Date) -> Int {
        let components = calendar.dateComponents([.year, .month], from: date)
        let firstDay = calendar.date(from: components)!
        return calendar.component(.weekday, from: firstDay)
    }

    func daysInPreviousMonth(for date: Date) -> Int {
        let previousMonth = calendar.date(byAdding: .month, value: -1, to: date)!
        return daysInMonth(for: previousMonth)
    }

    func completeWeeks(for date: Date) -> [[Int]] {
        let daysInCurrentMonth = daysInMonth(for: date)
        let firstWeekday = firstWeekdayOfMonth(for: date)
        let daysInPrevious = daysInPreviousMonth(for: date)

        var weeks: [[Int]] = []
        var currentWeek: [Int] = []

        for i in stride(from: daysInPrevious - firstWeekday + 1, through: daysInPrevious, by: 1) {
            currentWeek.append(i)
        }

        for day in 1...daysInCurrentMonth {
            currentWeek.append(day)
            if currentWeek.count == 7 {
                weeks.append(currentWeek)
                currentWeek = []
            }
        }

        var nextMonthDay = 1
        while currentWeek.count < 7 {
            currentWeek.append(nextMonthDay)
            nextMonthDay += 1
        }
        weeks.append(currentWeek)

        return weeks
    }

    func currentWeek(for date: Date) -> [Date] {
        let weekInterval = calendar.dateInterval(of: .weekOfYear, for: date)!
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: weekInterval.start) }
    }

    func dateFromDay(_ day: Int, in date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(bySetting: .day, value: day, of: calendar.date(from: components)!)!
    }
}

extension CalendarService {
    func isDayInCurrentMonth(_ day: Int, for date: Date) -> Bool {
        let daysInCurrentMonth = daysInMonth(for: date)
        let firstWeekday = firstWeekdayOfMonth(for: date)
        return day > 0 && day <= daysInCurrentMonth
    }
}
