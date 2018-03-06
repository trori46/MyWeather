//
//  CityCellViewModel.swift
//  MyWeather
//
//  Created by Viktoriia Rohozhyna on 3/6/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import Foundation

class CityCellViewModel {
    var cityTitle: String!
    var temperaturesString: String!
    var timeString: String!
    
    required init(weather: Weather) {
        self.cityTitle = weather.city
        self.temperaturesString = String(format:"%0.f%@", weather.temperature, "\u{0080}")
        
        let df = DateFormatter()
        let date = Date(timeIntervalSince1970: weather.timestamp)
        df.dateFormat = "HH:mm"
        self.timeString = df.string(from: date)
    }
}
