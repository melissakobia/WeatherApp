//
//  HomeView.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 13/01/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    @EnvironmentObject var locationManager: LocationManager
    
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Image(weatherViewModel.weather?.weather?.first?.type().image ?? "forest_sunny")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400)
                    .ignoresSafeArea(edges: .top)
                
                VStack(spacing: 10) {
                    Text("\(String(format: "%.2f", weatherViewModel.weather?.main?.temp ?? 0))º")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                    
                    
                    Text(weatherViewModel.weather?.weather?.first?.main?.uppercased() ?? "-----")
                        .font(.title)
                        .foregroundStyle(Color.white)
                        .kerning(3)
                }
                .padding(.bottom, 35)
            }
            
            forecastView
                .padding(.top, -60)
            
          
        }
        .ignoresSafeArea()
        .onReceive(locationManager.$location, perform: { value in
            guard let lat = value?.latitude, let lon = value?.latitude else { return }
            
            Task {
                await weatherViewModel.fetchCurrentWeather(lat: lat, lon: lon, appId: "609f6d8b08711e832280eca8fbdb41b2", units: "metric")
                await weatherViewModel.fetchWeatherForecast(lat: lat, lon: lon, appId: "609f6d8b08711e832280eca8fbdb41b2", units: "metric")
            }
            
        })
       
        
        
    }
    
    var forecastView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .center, spacing: 10) {
                    VStack(spacing: 5) {
                        Text("\(String(format: "%.2f", weatherViewModel.weather?.main?.tempMin ?? 0))º")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.white)
                        
                        Text("min")
                            .font(.footnote)
                            .foregroundStyle(Color.white)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 5) {
                        Text("\(String(format: "%.2f", weatherViewModel.weather?.main?.temp ?? 0))º")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.white)
                        
                        Text("current")
                            .font(.footnote)
                            .foregroundStyle(Color.white)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 5) {
                        Text("\(String(format: "%.2f", weatherViewModel.weather?.main?.tempMax ?? 0))º")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.white)
                        
                        Text("max")
                            .font(.footnote)
                            .foregroundStyle(Color.white)
                    }
                    
                }
                .padding(.horizontal)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(weatherViewModel.forecast) { item in
                        WeatherItemView(listItem: item)
                    }
                }
                .padding(.horizontal)
                
                
            }
            .padding(.vertical, 10)
        }
        .background {
            ZStack {
                weatherViewModel.weather?.weather?.first?.type().colors ?? Color.colorSunny
            }
        }
        .scrollIndicators(.hidden)
        
        
    }
}

#Preview {
    HomeView()
}


