//
//  Weather.swift
//  WeatherApp
//
//  Created by Данила Братинов on 20.01.2023.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let coord: Coord
    let weather: [WeatherElement]
    let main: Main
    let name: String
}

// MARK: - Main
struct Main: Codable {
    let temp, tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin
        case tempMax
    }
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let id: Int
    let main, description: String
}

//MARK: - Coord
struct Coord: Codable {
    let lon: Double
    let lat: Double

    enum CodingKeys: String, CodingKey {
        case lon
        case lat
    }
}
