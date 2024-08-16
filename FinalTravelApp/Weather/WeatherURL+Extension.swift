//
//  WeatherURL+Extension.swift
//  Final Travel App
//
//  Created by chandana on 16/08/24.
//

import Foundation

extension URL {
    
    static func urlForWeatherFor(_ COCTitle: String) -> URL? {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(COCTitle)&APPID=yourkey")
        else {
            return nil
        }
        return url
    }
}


extension String {
    func escaped() -> String? {
        let escapedString = self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        print("Original: \(self), Escaped: \(String(describing: escapedString))")
        return escapedString
    }
}
