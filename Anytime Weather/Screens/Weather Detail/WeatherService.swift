//
//  WeatherService.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import Alamofire

class WeatherService {
    
    func getWeather(city: String) {
        AF.request("https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=7bbd9a7ad38be2e7af7f8d5d41689c8d").response { response in
            debugPrint(response)
        }
    }
    
}