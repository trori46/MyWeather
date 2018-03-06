//
//  DetailsViewController.swift
//  MyWeather
//
//  Created by Viktoriia Rohozhyna on 3/6/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    weak var viewModel: DetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherLabel.text = viewModel.temperatureString
        self.windLabel.text = viewModel.windString
        self.cityLabel.text = viewModel.cityTitle
        self.precipitationLabel.text = viewModel.precipitationString
    }
    
    
    
    
    @IBAction func clickedBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
