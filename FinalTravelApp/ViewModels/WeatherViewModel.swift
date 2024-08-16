//
//  WeatherViewModel.swift
//  Final Travel App
//
//  Created by chandana on 16/08/24.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published private var weatherResponse: WeatherResponse?
    @Published var message: String = ""
    @Published var COCTitle: String = ""
    
    var temperature: Double {
        weatherResponse?.main.temp ?? 0.0
    }
    
    var icon: String {
        weatherResponse?.weather.first?.icon ?? ""
    }
    
    func fetchWeather(COCTitle: String) {
        guard let escapedCOCTitle = COCTitle.escaped() else {
            DispatchQueue.main.async {
                self.message = "City name is incorrect"
            }
            return
        }
                
        WeatherService().getWeather(COCTitle: escapedCOCTitle) { weatherResponse in
            DispatchQueue.main.async {
                if let weatherResponse = weatherResponse {
                    self.weatherResponse = weatherResponse
                    self.message = "Weather data fetched successfully"
                } else {
                    self.message = "Failed to fetch weather data"
                }
            }
        }
    }
}
