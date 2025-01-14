//
//  List.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 14/01/2025.
//

import Foundation

// MARK: - List
struct List: Codable, Identifiable {
    var id = UUID().uuidString
    var dt: Int?
    var main: Main?
    var weather: [Weather]?
    var clouds: Clouds?
    var wind: Wind?
    var visibility: Int?
    var pop: Double?
    var rain: Rain?
    var sys: Sys?
    var dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
    }
    
    func dayName() -> String? {
        let day = DateUtil.convertedDate(dtTxt ?? "", "EEEE", "yyyy-MM-dd HH:mm:ss")
        return day
    }
}
