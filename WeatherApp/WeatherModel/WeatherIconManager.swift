//
//  WeatherIconManager.swift
//  WeatherApp
//
//  Created by Lucky on 16/02/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import Foundation
import UIKit


enum WeatherIconManager: String {
    case ClearDay = "clear-day"
    case ClearNight = "clear-night"
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Wind = "wind"
    case Fog = "fog"
    case Cloudy = "cloudy"
    case PartlyCloudyDay = "partly-cloudy-day"
    case PartlyCloudyNight = "partly-cloudy-night"
    case UnpredictedIcon = "unpredicted-icon"
    
    init(rowValue: String) {
        switch rowValue {
        case "clear-day": self = .ClearDay
        case "clear-night": self = .ClearNight
        case "snow": self = .Snow
        case "sleet": self = .Sleet
        case "wind": self = .Wind
        case "fog": self = .Fog
        case "cloudy": self = .Cloudy
        case "partlyCloudyDay": self = .PartlyCloudyDay
        case "partlyCloudyNight" : self = .PartlyCloudyNight
        default:
            self = .UnpredictedIcon
        }
    }
}


extension WeatherIconManager {
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}

