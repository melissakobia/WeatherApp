//
//  Main.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 13/01/2025.
//

import Foundation


// MARK: - Main
struct Main: Codable {
    var temp, feelsLike, tempMin, tempMax: Double?
    var pressure, humidity, seaLevel, grndLevel: Int?
    var tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case tempKf = "temp_kf"
    }
}


    
