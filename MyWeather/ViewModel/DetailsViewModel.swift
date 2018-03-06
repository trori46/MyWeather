//
//  DetailsViewModel.swift
//  MyWeather
//
//  Created by Viktoriia Rohozhyna on 3/6/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import Foundation

class DetailsViewModel {
    var cityTitle: String!
    var windString: String!
    var precipitationString: String!
    var temperatureString: String!
    
    required init (weather: Weather) {
        self.cityTitle = weather.city
        self.temperatureString = String(format:"%0.f%@", weather.temperature, "\u{0080}")
        let windStr: String
        switch weather.windDirection! {
        case .north:
            windStr = "North"; break
        case .south:
            windStr = "South"; break
        case .west:
            windStr = "West"; break
        case .east:
            windStr = "East"; break
        }
        self.windString = String(format: "@ wind, %0.f m/s", windStr, weather.windSpeed)
        
        let precipitationStr: String
        switch weather.precipitation! {
        case .cloudly:
            precipitationStr = "Cloudly"
        case .rainy:
            precipitationStr = "Rainy"
        case .stormly:
            precipitationStr = "Stormly"
        case .thunderly:
            precipitationStr = "Thunderly"
        case .sunny:
            precipitationStr = "Sunny"
        }
        self.precipitationString = precipitationStr
        
    }
}
