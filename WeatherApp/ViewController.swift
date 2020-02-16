//
//  ViewController.swift
//  WeatherApp
//
//  Created by Lucky on 15/02/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var apparentTemperatureLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        toggleActivityIndicator(on: true)
        getCurrentWeatherData()
    }
    
    func toggleActivityIndicator(on: Bool) {
        refreshButton.isHidden = on
        
        if on {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    lazy var weatherManager = APIWeatherManager(apiKey: "ac4e92fe2a7ea43d78391631b7064bc7")
    let coordinates = Coordinates(latitude: 55.797145, longitude: 37.612893)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrentWeatherData()
        
        
    }
    
    func getCurrentWeatherData() {
        
        weatherManager.fetchCurrentWeatherWith(coordinates: coordinates) { (result) in
            self.toggleActivityIndicator(on: false)
            switch result {
            case .Success(let currentWeather):
                self.updaitUIWith(currentWeather: currentWeather)
            case .Failure(let error as NSError):
                self.callAlertController(title: "Unable to get data",
                                         message: "\(error.localizedDescription)",
                    error: error)
            }
        }
    }
    
    func callAlertController(title: String, message: String, error: NSError) {
        
        let alertController = UIAlertController(title: "",
                                                message: "",
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    /*
     // Create icon
     let icon = WeatherIconManager.Rain.image
     
     // Call the initializer
     let currentWeather = CurrentWeather.init(temperature: 10.0, apparentTemperature: 5.0, humidity: 30, pressure: 750, icon: icon)
     */
    
    /*
     // let urlString = "https://api.darksky.net/forecast/ac4e92fe2a7ea43d78391631b7064bc7/37.8267,-122.4233"
     // Create URL-Address (FixedPart1 - baseURL),(VariablePart)
     let baseURL = URL(string: "https://api.darksky.net/forecast/ac4e92fe2a7ea43d78391631b7064bc7/")
     
     let fullURL = URL(string: "37.8267,-122.4233", relativeTo: baseURL)
     
     // Create session settings
     let sessionConfiguration = URLSessionConfiguration.default
     let session = URLSession(configuration: sessionConfiguration)
     
     // Create request - this is the wrong code to compare
     let request = URLRequest(url: fullURL!)
     let dataTask = session.dataTask(with: fullURL!) { (data, response, error) in
     
     }
     dataTask.resume()
     */
    
    func updaitUIWith(currentWeather: CurrentWeather) {
        
        self.imageView.image = currentWeather.icon
        self.pressureLabel.text = currentWeather.pressureString
        self.temperatureLabel.text = currentWeather.temperatureString
        self.apparentTemperatureLabel.text = currentWeather.apparentTemperatureString
        self.humidityLabel.text = currentWeather.humidityString
    }
}










