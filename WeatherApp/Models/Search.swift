//
//  Search.swift
//  WeatherApp
//
//  Created by Данила Братинов on 21.01.2023.
//

import Foundation

struct SearchElement: Codable {
    let name: String
    let localNames: [String: String]?
    let lat, lon: Double
    let country, state: String

    enum CodingKeys: String, CodingKey {
        case name
        case localNames
        case lat, lon, country, state
    }
}

typealias Search = [SearchElement]
