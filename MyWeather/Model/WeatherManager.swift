//
//  WeatherManager.swift
//  MyWeather
//
//  Created by Viktoriia Rohozhyna on 3/6/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import Foundation

class WeatherManager {
    
    func getWeather(completion:@escaping ([Weather]) -> Void ) {
        //let delayIime = DispatchTime.now
        DispatchQueue.main.async {
            completion(self.mockResponse())
            }
    }
    
    private func mockResponse() -> [Weather] {
        var array = [Weather]()
        array.append(mockWeatherObject(temperature: 10.2, city: "Moscow", precipitation: .sunny, windSpeed: 2.1, windDirection: .north))
        array.append(mockWeatherObject(temperature: 8.2, city: "London", precipitation: .sunny, windSpeed: 0.1, windDirection: .south))
        array.append(mockWeatherObject(temperature: 18.9, city: "Madrid", precipitation: .sunny, windSpeed: 0, windDirection: .north))
        array.append(mockWeatherObject(temperature: 7.1, city: "Dublin", precipitation: .rainy, windSpeed: 4.7, windDirection: .east))
        array.append(mockWeatherObject(temperature: 22.5, city: "Tivat", precipitation: .sunny, windSpeed: 1.1, windDirection: .south))
        return array
    }
    
    private func mockWeatherObject(temperature: Float, city: String, precipitation: Precipitation, windSpeed: Float, windDirection: WindDirection) -> Weather {
     
        var weather = Weather()
        weather.temperature = temperature
        weather.city = city
        weather.timestamp = NSDate().timeIntervalSince1970
        weather.precipitation = precipitation
        weather.windSpeed = windSpeed
        weather.windDirection = windDirection
        return weather
    }
}
