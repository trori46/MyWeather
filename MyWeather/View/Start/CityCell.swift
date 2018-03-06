//
//  CityCell.swift
//  MyWeather
//
//  Created by Viktoriia Rohozhyna on 3/6/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import Foundation
import UIKit

class CityCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    weak var viewModel: CityCellViewModel! {
        didSet {
            self.timeLabel.text = viewModel.timeString
            self.cityLabel.text = viewModel.cityTitle
            self.temperatureLabel.text = viewModel.temperaturesString
        }
    }
}
