//
//  HomeView.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 13/01/2025.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Image("forest_sunny")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 450)
                
                VStack(spacing: 10) {
                    Text("25º")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        
                    
                    Text("SUNNY")
                        .font(.title)
                        .foregroundStyle(Color.white)
                        .kerning(3)
                }
                .padding(.top, -20)
            }
            .frame(height: 450)
            
            forecastView
                .padding(.top, -50)
            
            Spacer()
        
        }
        .ignoresSafeArea(edges: .top)
    }
    
    var forecastView: some View {
        ZStack {
            Color.colorSunny
            
            VStack(spacing: 20) {
                HStack(alignment: .center, spacing: 0) {
                    VStack(spacing: 5) {
                        Text("19º")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.white)
                        
                        Text("min")
                            .font(.footnote)
                            .foregroundStyle(Color.white)
                    }
                   
                    Spacer()
                    
                    VStack(spacing: 5) {
                        Text("35º")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.white)
                        
                        Text("current")
                            .font(.footnote)
                            .foregroundStyle(Color.white)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 5) {
                        Text("25º")
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
