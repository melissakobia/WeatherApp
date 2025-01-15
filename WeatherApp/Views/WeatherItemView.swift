//
//  WeatherItemView.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 13/01/2025.
//

import SwiftUI

struct WeatherItemView: View {
    @State var listItem: List
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Text(listItem.dayName() ?? "")
                .font(.subheadline)
                .foregroundStyle(Color.white)
            
            Spacer(minLength: 10)
            
            Image(listItem.weather?.first?.type().icon ?? "clear")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
            
            Spacer(minLength: 10)
            
            Text("\(String(format: "%.2f", listItem.main?.temp ?? 0))º")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    WeatherItemView(listItem: List())
}
