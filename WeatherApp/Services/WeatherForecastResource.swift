//
//  WeatherForecastResource.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 14/01/2025.
//

import Foundation

struct WeatherForecastResource: APIResource {
    typealias ModelType = WeatherForecast
    
    var path: String { "forecast" }
    
    var lat: Double
    
    var lon: Double
    
    var appId: String
    
    var units: String
    
    init(lat: Double, lon: Double, appId: String, units: String) {
        self.lat = lat
        self.lon = lon
        self.appId = appId
        self.units = units
    }
    
    
}
