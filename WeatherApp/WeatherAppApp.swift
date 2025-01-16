//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 13/01/2025.
//

import SwiftUI
import SwiftData
import GooglePlaces


@main
struct WeatherAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
//        .modelContainer(sharedModelContainer)
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        GMSPlacesClient.provideAPIKey("AIzaSyArPK43avwFweLgkdlch0tUkn9zgGqxZEQ")
    }
}
