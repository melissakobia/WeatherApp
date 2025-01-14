//
//  DateUtil.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 14/01/2025.
//

import Foundation


struct DateUtil {
    static func convertedDate(_ date: String, _ toFormat: String, _ fromFormat: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = fromFormat
        formatter.timeZone = TimeZone.current
        
        if let newDate = formatter.date(from: date) {
            formatter.dateFormat = toFormat
            return formatter.string(from: newDate)
        } else {
            return nil
        }
    }
}
