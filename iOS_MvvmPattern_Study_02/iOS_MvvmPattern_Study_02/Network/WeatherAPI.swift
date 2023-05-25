//
//  WeatherAPI.swift
//  iOS_MvvmPattern_Study_02
//
//  Created by 여성일 on 2023/05/22.
//

import Foundation

private struct Constants {
    struct URLComponents {
        static let WEATER_API_SCHEMA: String = "https"
        static let WEATHER_API_HOST: String = "api.openweathermap.org"
        static let WEATHER_API_PATH: String = "/data/2.5/group"
    }
}

struct WeatherAPI {
    func getURL(query: String, apiId: String, lang: String, units: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = Constants.URLComponents.WEATER_API_SCHEMA
        components.host = Constants.URLComponents.WEATHER_API_HOST
        components.path = Constants.URLComponents.WEATHER_API_PATH
        
        components.queryItems = [
            URLQueryItem(name: "id", value: query),
            URLQueryItem(name: "appid", value: apiId),
            URLQueryItem(name: "lang", value: lang),
            URLQueryItem(name: "units", value: units)
        ]
        
        return components
    }
}
