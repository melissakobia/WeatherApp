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
    @Published private(set) var isLoading = false
    @Published var errorMessage: String = ""
    
    
    func fetchCurrentWeather1(lat: Double, lon: Double, appId: String, units: String) async {
        debugPrint("This method is called")
        let resource = WeatherResource(lat: lat, lon: lon, appId: appId, units: units)
        debugPrint("The url is:- \(resource.url.absoluteString)")
        let request = APIRequest(resource: resource)
        guard let weather = try? await request.execute() else { return }
        self.weather = weather
    }
    
    func fetchCurrentWeather(lat: Double, lon: Double, appId: String, units: String) async {
        debugPrint("This method is called")
        let resource = WeatherResource(lat: lat, lon: lon, appId: appId, units: units)
        debugPrint("The url is:- \(resource.url.absoluteString)")
        
        guard let currentWeather: Weather = await WeatherService().fetchCurrentWeatherData(fromURL: resource.url) else { return }
        
        self.weather = currentWeather
    }
    
  
}
