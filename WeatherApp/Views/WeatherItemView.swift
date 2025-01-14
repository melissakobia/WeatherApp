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
            Text("Sunday")
                .font(.subheadline)
                .foregroundStyle(Color.white)
            Spacer()
            
            Image("clear")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
            
            Spacer()
            
            Text("19º")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    WeatherItemView(listItem: List())
}
