//
//  WeatherForecast.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 14/01/2025.
//

import Foundation

// MARK: - WeatherForecast
struct WeatherForecast: Codable {
    var cod: String?
    var message, cnt: Int?
    var list: [List]?
    var city: City?
}

