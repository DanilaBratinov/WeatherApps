//
//  Cities.swift
//  WeatherApp
//
//  Created by Данила Братинов on 21.01.2023.
//

import Foundation

struct Cities: Codable {
    let name: String
    let temperature: Double
    let description: String
    
    let tempMin: Double
    let tempMax: Double
    
    let lat: Double
    let lon: Double
}
