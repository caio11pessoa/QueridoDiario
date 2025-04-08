//
//  DateFormatterHelper.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 08/04/25.
//

import Foundation

class DateFormatterHelper {
    static let shared = DateFormatterHelper()
    
    private let dayFormatter: DateFormatter
    private let timeFormatter: DateFormatter
    private let periodFormatter: DateFormatter
    
    private init() {
        dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEE" // Abreviação do dia (seg, ter, etc.)
        dayFormatter.locale = Locale(identifier: "pt_BR")
        
        timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm" // Formato de hora (hh:mm)
        
        periodFormatter = DateFormatter()
        periodFormatter.dateFormat = "a" // AM ou PM
    }
    
    func format(date: Date) -> (day: String, time: String, period: String) {
        let day = dayFormatter.string(from: date).uppercased()
        let time = timeFormatter.string(from: date)
        let period = periodFormatter.string(from: date).uppercased()
        return (day, time, period)
    }
}
