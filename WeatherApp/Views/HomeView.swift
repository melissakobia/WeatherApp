//
//  HomeView.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 13/01/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var weatherViewModel: WeatherViewModel = WeatherViewModel()
    
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Image("forest_sunny")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 450)
                
                VStack(spacing: 10) {
                    Text("\(String(format: "%.2f", weatherViewModel.weather?.main?.feelsLike ?? 0))º")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                    
                    
                    Text(weatherViewModel.weather?.weather?.first?.main?.uppercased() ?? "SUNNY")
                        .font(.title)
                        .foregroundStyle(Color.white)
                        .kerning(3)
                }
                .padding(.top, -40)
            }
            .frame(height: 450)
            
            forecastView
                .padding(.top, -50)
            
          
        }
        .ignoresSafeArea(edges: .top)
        .task {
            await weatherViewModel.fetchCurrentWeather(lat: 1.2921, lon: 36.8219, appId: "609f6d8b08711e832280eca8fbdb41b2", units: "metric")
            await weatherViewModel.fetchWeatherForecast(lat: 1.2921, lon: 36.8219, appId: "609f6d8b08711e832280eca8fbdb41b2", units: "metric")
        }
        
        
    }
    
    var forecastView: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack(alignment: .center, spacing: 0) {
                    VStack(spacing: 5) {
                        Text("\(String(format: "%.2f", weatherViewModel.weather?.main?.tempMin ?? 0))º")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.white)
                        
                        Text("min")
                            .font(.footnote)
                            .foregroundStyle(Color.white)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 5) {
                        Text("\(String(format: "%.2f", weatherViewModel.weather?.main?.temp ?? 0))º")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.white)
                        
                        Text("current")
                            .font(.footnote)
                            .foregroundStyle(Color.white)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 5) {
                        Text("\(String(format: "%.2f", weatherViewModel.weather?.main?.tempMax ?? 0))º")
                            .font(.subheadline)
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
        }
        .background {
            ZStack {
                Color.colorSunny
            }
        }
        .scrollIndicators(.hidden)
        
        
    }
}

#Preview {
    HomeView()
}
