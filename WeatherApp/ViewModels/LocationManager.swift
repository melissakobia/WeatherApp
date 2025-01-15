//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 15/01/2025.
//

import Foundation
import CoreLocation

 class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var location: CLLocationCoordinate2D?
    private var manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.startUpdatingLocation()
        
        self.checkLocationAuthorization()
        
    }
    
    func checkLocationAuthorization() {
        
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            
        case .restricted:
            print("Location Per restricted")
            
        case .denied:
            print("Location denied")
            manager.requestWhenInUseAuthorization()
            
        case .authorizedAlways:
            print("Location authorized always")
            location = manager.location?.coordinate
            
        case .authorizedWhenInUse:
            
            print("Location authorized when in use")
            location = manager.location?.coordinate
            
        @unknown default:
            print("Location service disabled")
            
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        
    }
}
