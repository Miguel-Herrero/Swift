//
//  WeatherVC.swift
//  Rainy Shiny Cloudy
//
//  Created by Miguel Herrero on 13/12/16.
//  Copyright © 2016 Miguel Herrero. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentTempImage: UIImageView!
    @IBOutlet weak var currentTempTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails { 
            //Setup UI to load downloaded data
            self.updateMainUI()
        }
    }
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp) ºC"
        currentTempTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentTempImage.image = UIImage(named: currentWeather.weatherType)
    }

}

extension WeatherVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)

        return cell
    }
}
