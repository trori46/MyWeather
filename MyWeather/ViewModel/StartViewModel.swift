//
//  StartViewModel.swift
//  MyWeather
//
//  Created by Viktoriia Rohozhyna on 3/6/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import Foundation

class StartViewModel {
    weak var weatherManager: WeatherManager!
    private var cellsArray = [CityCellViewModel]()
    private var weatherArray: [Weather]!
    var detailsViewModel: DetailsViewModel!
    
    func updateWeather(completion:@escaping () -> Void) {
        cellsArray.removeAll()
        weatherManager.getWeather { (weatherArray) -> Void in
            self.weatherArray = weatherArray
            for weatherObject in self.weatherArray {
                self.cellsArray.append(CityCellViewModel(weather: weatherObject))
            }
            completion()
        }
    }
    
    func numberOfCities() -> Int {
        return cellsArray.count
    }
    
    func cellViewModel(index: Int) -> CityCellViewModel? {
        guard index < cellsArray.count else { return nil }
        return cellsArray[index]
    }
    func detailsViewModel(index: Int) -> DetailsViewModel {
        self.detailsViewModel = DetailsViewModel(weather: weatherArray[index])
        return self.detailsViewModel
    }
    required init(weatherManager: WeatherManager) {
        self.weatherManager = weatherManager
    }
}
