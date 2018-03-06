//
//  AppDelegate.swift
//  MyWeather
//
//  Created by Viktoriia Rohozhyna on 3/6/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let weatherManager = WeatherManager()
    var startViewModel: StartViewModel!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.startViewModel = StartViewModel(weatherManager: weatherManager)
        if let startController = self.window?.rootViewController as?
            StartViewController {
            startController.viewModel = startViewModel
        }
        return true
    }

}

