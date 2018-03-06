//
//  StartViewController.swift
//  MyWeather
//
//  Created by Viktoriia Rohozhyna on 3/6/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    weak var viewModel: StartViewModel! {
        didSet {
        viewModel.updateWeather {
        self.tableView.reloadData()
        self.activityView.stopAnimating()
        }
      }
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    let cellIdentifier = String(describing: CityCell())
    let segueIdentifier = "ShowDetails"
    //view cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == segueIdentifier,
        let detailsController = segue.destination as? DetailsViewController,
            let index = sender as? Int {
            detailsController.viewModel = self.viewModel.detailsViewModel(index: index)
        }
    }
    //tableView
    func setupTableView() {
        self.tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
        self.tableView.contentInset.top = 20
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCities()
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CityCell
        if cell == nil {
            cell = UINib(nibName: cellIdentifier, bundle: nil).instantiate(withOwner: nil, options: nil).first as? CityCell
        }
        cell!.viewModel = self.viewModel.cellViewModel(index: indexPath.row)
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: segueIdentifier, sender: indexPath.row)
    }
}
