//
//  WeatherElement.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 13/01/2025.
//

import Foundation

// MARK: - WeatherElement
struct WeatherElement: Codable {
    var id: Int?
    var main, description, icon: String?
    
    func type() -> WeatherType {
        guard let weather = WeatherType(rawValue: main ?? "") else { return .sunny}
        
        return weather
    }
}
