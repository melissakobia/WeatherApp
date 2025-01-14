//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 13/01/2025.
//

import Foundation

class WeatherService {
    func fetchCurrentWeatherData<T: Codable>(fromURL: URL) async -> T? {
        do {
            let (data, response) = try await URLSession.shared.data(from: fromURL)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.invalidResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.invalidStatusCode }
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse }
            
            return decodedResponse
        } catch NetworkError.invalidUrl {
            print("There was an error creating the URL")
        } catch NetworkError.invalidResponse {
            print("Did not get a valid response")
        } catch NetworkError.invalidStatusCode {
            print("Did not get a 2xx status code from the response")
        } catch NetworkError.failedToDecodeResponse {
            print("Failed to decode response into the given type")
        } catch {
            print("An error occured downloading the data")
        }
        
        return nil
    }
    
    
}


enum NetworkError: Error {
    case invalidUrl
    case invalidRequest
    case invalidResponse
    case invalidStatusCode
    case failedToDecodeResponse
}
