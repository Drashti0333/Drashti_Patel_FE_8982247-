//
//  WeatherDetailTableViewCell.swift
//  Drashti_Patel_FE_8982247
//
//  Created by user236597 on 4/11/24.
//

import UIKit

class WeatherDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var tempratureLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windspeedLabel: UILabel!
        

    func setup(data: WeatherCoreData) {
        windspeedLabel.text = "Wind: \(data.wind ?? "")"
        humidityLabel.text = "Humidity: \(data.humidity ?? "")"
        tempratureLabel.text = "Temp: \(data.temp ?? "")"
        timeLabel.text = "Time: \(data.time ?? "")"
        dateLabel.text = data.date ?? ""
        fromLabel.text = data.from ?? ""
        cityLabel.text = data.cityName ?? ""
    }
}

