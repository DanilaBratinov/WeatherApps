import Foundation

// MARK: - Forcast
struct Forcast: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [List]
    
    enum CodingKeys: String, CodingKey {
        case cod
        case message
        case cnt
        case list
    }
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]?
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let sys: Sys
    let dtTxt: String
    let snow: Snow?
    
    enum CodingKeys: String, CodingKey {
        case dt
        case main
        case weather
        case clouds
        case wind
        case visibility
        case pop
        case sys
        case dtTxt
        case snow
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
    
    enum CodingKeys: String, CodingKey {
        case all
    }
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let seaLevel: Int
    let grndLevel: Int
    let humidity: Int
    let tempKf: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike
        case tempMin
        case tempMax
        case pressure
        case seaLevel
        case grndLevel
        case humidity
        case tempKf
    }
}

// MARK: - Snow
struct Snow: Codable {
    let the3H: Double
    
    enum CodingKeys: String, CodingKey {
        case the3H
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: Pod
    
    enum CodingKeys: String, CodingKey {
        case pod
    }
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: MainEnum
    let description: Description
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case main
        case description
        case icon
    }
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightSnow = "light snow"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case snow = "Snow"
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
    
    enum CodingKeys: String, CodingKey {
        case speed
        case deg
        case gust
    }
}
