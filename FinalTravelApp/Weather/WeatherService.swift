//
//  WeatherService.swift
//  Final Travel App
//
//  Created by chandana on 16/08/24.
//

import Foundation

class WeatherService {
    func getWeather(COCTitle: String, completion: @escaping (WeatherResponse?) -> Void) {
        guard let url = URL.urlForWeatherFor(COCTitle) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            completion(weatherResponse)
        }.resume()
    }
}


struct WeatherResponse: Decodable {
    let main: WeatherMain
    let weather: [WeatherDetail]
}
struct WeatherMain: Decodable {
    let temp: Double
}
struct WeatherDetail: Decodable {
    let icon: String
}
