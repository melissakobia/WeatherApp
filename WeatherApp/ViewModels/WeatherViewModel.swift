//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 14/01/2025.
//

import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var weather: Weather? = nil
    @Published var forecast: [List] = []
    @Published private(set) var isLoading = false
    @Published var errorMessage: String = ""
    
    
    func fetchCurrentWeather(lat: Double, lon: Double, appId: String, units: String) async {
        let resource = WeatherResource(lat: lat, lon: lon, appId: appId, units: units)
        
        guard let currentWeather: Weather = await WeatherService().fetchCurrentWeatherData(fromURL: resource.url) else { return }
        
        self.weather = currentWeather
    }
    
    func fetchWeatherForecast(lat: Double, lon: Double, appId: String, units: String) async {
        let resource = WeatherForecastResource(lat: lat, lon: lon, appId: appId, units: units)
        
        guard let forecastResponse: WeatherForecast = await WeatherService().fetchCurrentWeatherData(fromURL: resource.url), let forecastList = forecastResponse.list else { return }
        
        self.forecast = forecastList
    }
    
    func fetchCurrentWeather1(lat: Double, lon: Double, appId: String, units: String) async {
        let resource = WeatherResource(lat: lat, lon: lon, appId: appId, units: units)
        let request = APIRequest(resource: resource)
        guard let weather = try? await request.execute() else { return }
        self.weather = weather
    }
    
  
}
