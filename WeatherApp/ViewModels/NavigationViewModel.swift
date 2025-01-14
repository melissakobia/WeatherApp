//
//  NavigationViewModel.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 13/01/2025.
//

import Foundation

class NavigationViewModel: ObservableObject {
    @Published private(set) var weather: Weather? = nil
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String? = nil
    
    @MainActor
    func fetchCurrentWeather(lat: Double, lon: Double, appId: String) async {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil // Reset error state
        do { isLoading = false }
        
        do {
            let resource = WeatherResource(lat: lat, lon: lon, appId: appId)
            let request = APIRequest(resource: resource)
            weather = try await request.execute()
        } catch {
            errorMessage = "Unable to fetch weather report for your location : \(error.localizedDescription)"
        }
        
    }
    
    
}
