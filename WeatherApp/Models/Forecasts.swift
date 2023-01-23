//
//  Forecasts.swift
//  WeatherApp
//
//  Created by Данила Братинов on 23.01.2023.
//

import Foundation

struct Forecast: Codable {
    let now: Int
    let nowDt: String
    let info: Info
    let geoObject: GeoObject
    let yesterday: Yesterday
    let fact: Fact
    let forecasts: [ForecastElement]

    enum CodingKeys: String, CodingKey {
        case now
        case nowDt
        case info
        case geoObject
        case yesterday
        case fact
        case forecasts
    }
}

// MARK: - Fact
struct Fact: Codable {
    let obsTime: Int
    let uptime: Int
    let temp: Int
    let feelsLike: Int
    let icon: Icon
    let condition: Condition
    let cloudness: Int
    let precType: Int
    let precProb: Int
    let precStrength: Int
    let isThunder: Bool
    let windSpeed: Double
    let windDir: WindDir
    let pressureMm: Int
    let pressurePa: Int
    let humidity: Int
    let daytime: Daytime
    let polar: Bool
    let season: String
    let source: String
    let accumPrec: [String: Double]
    let soilMoisture: Double
    let soilTemp: Int
    let uvIndex: Int
    let windGust: Double

    enum CodingKeys: String, CodingKey {
        case obsTime
        case uptime
        case temp
        case feelsLike
        case icon
        case condition
        case cloudness
        case precType
        case precProb
        case precStrength
        case isThunder
        case windSpeed
        case windDir
        case pressureMm
        case pressurePa
        case humidity
        case daytime
        case polar
        case season
        case source
        case accumPrec
        case soilMoisture
        case soilTemp
        case uvIndex
        case windGust
    }
}

enum Condition: String, Codable {
    case lightSnow = "light-snow"
    case overcast = "overcast"
}

enum Daytime: String, Codable {
    case d = "d"
    case n = "n"
}

enum Icon: String, Codable {
    case ovc = "ovc"
    case ovcSn = "ovc_-sn"
}

enum WindDir: String, Codable {
    case e = "e"
    case s = "s"
    case se = "se"
    case sw = "sw"
    case w = "w"
}

// MARK: - ForecastElement
struct ForecastElement: Codable {
    let date: String
    let dateTs: Int
    let week: Int
    let sunrise: String
    let sunset: String
    let riseBegin: String
    let setEnd: String
    let moonCode: Int
    let moonText: String
    let parts: Parts
    let hours: [Hour]
    let biomet: Biomet?

    enum CodingKeys: String, CodingKey {
        case date
        case dateTs
        case week
        case sunrise
        case sunset
        case riseBegin
        case setEnd
        case moonCode
        case moonText
        case parts
        case hours
        case biomet
    }
}

// MARK: - Biomet
struct Biomet: Codable {
    let index: Int
    let condition: String

    enum CodingKeys: String, CodingKey {
        case index
        case condition
    }
}

// MARK: - Hour
struct Hour: Codable {
    let hour: String
    let hourTs: Int
    let temp: Int
    let feelsLike: Int
    let icon: Icon
    let condition: Condition
    let cloudness: Int
    let precType: Int
    let precStrength: Int
    let isThunder: Bool
    let windDir: WindDir
    let windSpeed: Double
    let windGust: Double
    let pressureMm: Int
    let pressurePa: Int
    let humidity: Int
    let uvIndex: Int
    let soilTemp: Int
    let soilMoisture: Double
    let precMm: Int
    let precPeriod: Int
    let precProb: Int

    enum CodingKeys: String, CodingKey {
        case hour
        case hourTs
        case temp
        case feelsLike
        case icon
        case condition
        case cloudness
        case precType
        case precStrength
        case isThunder
        case windDir
        case windSpeed
        case windGust
        case pressureMm
        case pressurePa
        case humidity
        case uvIndex
        case soilTemp
        case soilMoisture
        case precMm
        case precPeriod
        case precProb
    }
}

// MARK: - Parts
struct Parts: Codable {
    let night: Day
    let nightShort: Day
    let dayShort: Day
    let morning: Day
    let day: Day
    let evening: Day

    enum CodingKeys: String, CodingKey {
        case night
        case nightShort
        case dayShort
        case morning
        case day
        case evening
    }
}

// MARK: - Day
struct Day: Codable {
    let source: String
    let tempMin: Int?
    let tempAvg: Int?
    let tempMax: Int?
    let windSpeed: Double
    let windGust: Double
    let windDir: WindDir
    let pressureMm: Int
    let pressurePa: Int
    let humidity: Int
    let soilTemp: Int
    let soilMoisture: Double
    let precMm: Double
    let precProb: Int
    let precPeriod: Int
    let cloudness: Int
    let precType: Int
    let precStrength: Double
    let icon: Icon
    let condition: Condition
    let uvIndex: Int?
    let feelsLike: Int
    let daytime: Daytime
    let polar: Bool
    let freshSnowMm: Int
    let temp: Int?

    enum CodingKeys: String, CodingKey {
        case source
        case tempMin
        case tempAvg
        case tempMax
        case windSpeed
        case windGust
        case windDir
        case pressureMm
        case pressurePa
        case humidity
        case soilTemp
        case soilMoisture
        case precMm
        case precProb
        case precPeriod
        case cloudness
        case precType
        case precStrength
        case icon
        case condition
        case uvIndex
        case feelsLike
        case daytime
        case polar
        case freshSnowMm
        case temp
    }
}

// MARK: - GeoObject
struct GeoObject: Codable {
    let district: Country
    let locality: Country
    let province: Country
    let country: Country

    enum CodingKeys: String, CodingKey {
        case district
        case locality
        case province
        case country
    }
}

// MARK: - Country
struct Country: Codable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

// MARK: - Info
struct Info: Codable {
    let n: Bool
    let geoid: Int
    let url: String
    let lat: Double
    let lon: Double
    let tzinfo: Tzinfo
    let defPressureMm: Int
    let defPressurePa: Int
    let slug: String
    let zoom: Int
    let nr: Bool
    let ns: Bool
    let nsr: Bool
    let p: Bool
    let f: Bool
    let h: Bool

    enum CodingKeys: String, CodingKey {
        case n
        case geoid
        case url
        case lat
        case lon
        case tzinfo
        case defPressureMm
        case defPressurePa
        case slug
        case zoom
        case nr
        case ns
        case nsr
        case p
        case f
        case h
    }
}

// MARK: - Tzinfo
struct Tzinfo: Codable {
    let name: String
    let abbr: String
    let dst: Bool
    let offset: Int

    enum CodingKeys: String, CodingKey {
        case name
        case abbr
        case dst
        case offset
    }
}

// MARK: - Yesterday
struct Yesterday: Codable {
    let temp: Int

    enum CodingKeys: String, CodingKey {
        case temp
    }
}
