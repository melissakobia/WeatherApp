//
//  WeatherResource.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 14/01/2025.
//

import Foundation

struct WeatherResource: APIResource {
    typealias ModelType = Weather
    
    var path: String { "weather" }
    
    var lat: Double
    
    var lon: Double
    
    var appId: String
    
    init(lat: Double, lon: Double, appId: String) {
        self.lat = lat
        self.lon = lon
        self.appId = appId
    }
    
    
}
