//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 13/01/2025.
//

import Foundation

class WeatherService {
    func fetchCurrentWeatherData() async throws -> Weather {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=609f6d8b08711e832280eca8fbdb41b2")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let weather = try JSONDecoder().decode(Weather.self, from: data)
        return weather
    }
}
