//
//  Weather.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 13/01/2025.
//

import Foundation

// MARK: - Weather
struct Weather: Codable, Identifiable {
    var coord: Coord?
    var weather: [WeatherElement]
    var base: String?
    var main: Main?
    var visibility: Int?
    var wind: Wind?
    var rain: Rain?
    var clouds: Clouds?
    var dt: Int?
    var sys: Sys?
    var timezone, id: Int?
    var name: String?
    var cod: Int?
}
