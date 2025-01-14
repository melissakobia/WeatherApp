//
//  APIResource.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 14/01/2025.
//

import Foundation

protocol APIResource {
    associatedtype ModelType: Codable
    var path: String { get }
    
    // Dynamic query parameters
    var lat: Double { get }
    var lon: Double { get }
    var appId: String { get }
}

extension APIResource {
    var url: URL {
        var queryItems = [
            URLQueryItem(name: "lat", value: String(lat)),
            URLQueryItem(name: "lon", value: String(lon)),
            URLQueryItem(name: "appid", value: appId)
        ]
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5")!
            .appendingPathComponent(path)
            .appending(queryItems: queryItems)
        
        return url
    }
}
