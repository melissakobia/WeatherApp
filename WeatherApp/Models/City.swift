//
//  City.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 14/01/2025.
//

import Foundation

// MARK: - City
struct City: Codable {
    var id: Int?
    var name: String?
    var coord: Coord?
    var country: String?
    var population, timezone, sunrise, sunset: Int?
}
