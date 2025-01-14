//
//  APIRequest.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 14/01/2025.
//

import Foundation

class APIRequest {
    let resource: WeatherResource

    init(resource: WeatherResource) {
        self.resource = resource
    }
}

extension APIRequest: NetworkRequest {
    func decode(_ data: Data) throws -> WeatherResource.ModelType {
        let weather = try JSONDecoder().decode(Weather.self, from: data)
        return weather
    }

    func execute() async throws -> WeatherResource.ModelType {
        try await load(resource.url)
    }
}
