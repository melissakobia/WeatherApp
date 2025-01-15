//
//  WeatherType.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 15/01/2025.
//

import Foundation
import SwiftUI

enum WeatherType: String, CaseIterable {
    case sunny = "Sunny"
    case clouds = "Clouds"
    case clear = "Clear"
    case snow = "Snow"
    case drizzle = "Drizzle"
    case rain = "Rain"
    
    var icon: String {
        switch self {
        case .sunny:
            "clear"
        case .clouds:
            "partlysunny"
        case .clear:
            "clear"
        case .snow:
            "partlysunny"
        case .drizzle:
            "rain"
        case .rain:
            "rain"
        }
    }
    
    var image: String {
        switch self {
        case .sunny:
            "forest_sunny"
        case .clouds:
            "forest_cloudy"
        case .clear:
            "forest_sunny"
        case .snow:
            "forest_cloudy"
        case .drizzle:
            "forest_rainy"
        case .rain:
            "forest_rainy"
        }
    }
    
    var colors: Color {
        switch self {
        case .sunny:
            Color.colorSunny
        case .clouds:
            Color.colorCloudy
        case .clear:
            Color.colorSunny
        case .snow:
            Color.colorCloudy
        case .drizzle:
            Color.colorRainy
        case .rain:
            Color.colorRainy
        }
    }
}
