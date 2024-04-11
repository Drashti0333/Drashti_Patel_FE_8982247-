//
//  Weather.swift
//  Drashti_Patel_FE_8982247
//
//  Created by user236597 on 4/11/24.
//

import UIKit

class Weather: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var HumidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.title = "Weather"
        fetchWeatherData(for: "Waterloo")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(rightBttnTapped))
        self.tabBarController?.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func rightBttnTapped() {
        showCityInputAlert(on: self, title: "Enter City Name", message: "Please enter the name of the city:") { [weak self] cityName in
            self?.fetchWeatherData(for: cityName)
        }
    }
    
    
    
    private func fetchWeatherData(for city: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=e37319c9d12742b2a2e894082672ea55&units=metric") else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching weather data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let weatherData = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async {
                    self?.updateUI(with: weatherData)
                }
            } catch {
                print("Error decoding weather data: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func Weather(data: WeatherModel) {
        DataSavingManager.shared.saveWeather(cityName: data.name,
                                date: Date.getCurrentDate(),
                                humidity: "\(data.main.humidity)%",
                                temp: "\(Int(data.main.temp))°C",
                                time: Date().currentTime(),
                                wind: "\(data.wind.speed) km/h")
    }
    
    private func updateUI(with weatherData: WeatherModel) {
        cityNameLabel.text = weatherData.name
        descriptionLabel.text = weatherData.weather.first?.description ?? "N/A"
        temperatureLabel.text = "\(Int(weatherData.main.temp))°C"
        HumidityLabel.text = "Humidity: \(weatherData.main.humidity)%"
        windSpeedLabel.text = "Wind: \(weatherData.wind.speed) km/h"
        
        Weather(data: weatherData)
    }
}
