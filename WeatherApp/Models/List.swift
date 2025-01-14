//
//  List.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 14/01/2025.
//

import Foundation

// MARK: - List
struct List: Codable {
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
}
