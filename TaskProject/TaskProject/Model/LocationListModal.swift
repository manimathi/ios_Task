//
//  LocationListModal.swift
//  TaskProject
//
//  Created by Manikandan on 17/12/22.
//

import Foundation

// MARK: - LocationListModal
struct LocationListModal: Codable {
    var location: Location?
    var current: Current?
    var forecast: Forecast?
}

// MARK: - Current
struct Current: Codable {
    var lastUpdatedEpoch: Int?
    var lastUpdated: String?
    var tempC: Int?
    var tempF: Double?
    var isDay: Int?
    var condition: Condition?
    var windMph, windKph: Double?
    var windDegree: Int?
    var windDir: String?
    var pressureMB: Int?
    var pressureIn: Double?
    var precipMm, precipIn, humidity, cloud: Int?
    var feelslikeC, feelslikeF: Double?
    var visKM, visMiles, uv: Int?
    var gustMph, gustKph: Double?

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

// MARK: - Condition
struct Condition: Codable {
    var text: String?
    var icon: String?
    var code: Int?
}

enum Text: String, Codable {
    case clear = "Clear"
    case cloudy = "Cloudy"
    case lightRainShower = "Light rain shower"
    case mist = "Mist"
    case partlyCloudy = "Partly cloudy"
    case patchyRainPossible = "Patchy rain possible"
    case sunny = "Sunny"
}

// MARK: - Forecast
struct Forecast: Codable {
    var forecastday: [Forecastday]?
}

// MARK: - Forecastday
struct Forecastday: Codable {
    var date: String?
    var dateEpoch: Int?
    var day: Day?
    var astro: Astro?
    var hour: [Hour]?

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}

// MARK: - Astro
struct Astro: Codable {
    var sunrise, sunset, moonrise, moonset: String?
    var moonPhase, moonIllumination: String?

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
    }
}

// MARK: - Day
struct Day: Codable {
    var maxtempC, maxtempF,mintempF, mintempC: Double?
    var avgtempC, avgtempF, maxwindMph, maxwindKph: Double?
    var totalprecipMm, totalprecipIn: Double?
    var totalsnowCM, avgvisKM, avgvisMiles, avghumidity: Int?
    var dailyWillItRain, dailyChanceOfRain, dailyWillItSnow, dailyChanceOfSnow: Int?
    var condition: Condition?
    var uv: Int?

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case totalsnowCM = "totalsnow_cm"
        case avgvisKM = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition, uv
    }
}

// MARK: - Hour
struct Hour: Codable {
    var timeEpoch: Int?
    var time: String?
    var tempC, tempF: Double?
    var isDay: Int?
    var condition: Condition?
    var windMph, windKph: Double?
    var windDegree: Int?
    var windDir: String?
    var pressureMB: Int?
    var pressureIn, precipMm, precipIn: Double?
    var humidity, cloud: Int?
    var feelslikeC, feelslikeF, windchillC, windchillF: Double?
    var heatindexC, heatindexF, dewpointC, dewpointF: Double?
    var willItRain, chanceOfRain, willItSnow, chanceOfSnow: Int?
    var visKM, visMiles: Int?
    var gustMph, gustKph: Double?
    var uv: Int?

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv
    }
}

enum WindDir: String, Codable {
    case n = "N"
    case ne = "NE"
    case nne = "NNE"
}

// MARK: - Location
struct Location: Codable {
    var name, region, country: String?
    var lat, lon: Double?
    var tzID: String?
    var localtimeEpoch: Int?
    var localtime: String?

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
