//
//  Rain.swift
//  WeatherApp
//
//  Created by Melissa Kobia on 13/01/2025.
//

import Foundation

// MARK: - Rain
struct Rain: Codable {
    var the1H: Double?
    var the3H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
        case the3H = "3h"
    }
}
