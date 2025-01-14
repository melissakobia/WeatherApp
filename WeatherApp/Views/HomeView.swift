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
                    Text("\(String(format: "%.2f", weatherViewModel.weather?.main?.temp ?? 0))º")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                    
                    
                    Text(weatherViewModel.weather?.weather.first?.main ?? "SUNNY")
                        .font(.title)
                        .foregroundStyle(Color.white)
                        .kerning(3)
                }
                .padding(.top, -20)
            }
            .frame(height: 450)
            
            forecastView
                .padding(.top, -50)
            
            Text(weatherViewModel.errorMessage)
                .font(.footnote)
                .foregroundStyle(Color.white)
            
            Spacer()
            
        }
        .ignoresSafeArea(edges: .top)
        .onAppear {
            Task {
                await weatherViewModel.fetchCurrentWeather(lat: 1.2921, lon: 36.8219, appId: "609f6d8b08711e832280eca8fbdb41b2", units: "metric")
            }
        }
        
    }
    
    var forecastView: some View {
        ZStack {
            Color.colorSunny
            
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
                    ForEach(0...5, id: \.self) { item in
                        WeatherItemView()
                    }
                }
                .padding(.horizontal)
                
                
            }
            
        }
    }
}

#Preview {
    HomeView()
}
