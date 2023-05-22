//
//  Entity.swift
//  iOS_MvvmPattern_Study_02
//
//  Created by 여성일 on 2023/05/22.
//

import Foundation

struct WeatherResponse: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Weather: Decodable {
    let main: String
    let icon: String
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

extension WeatherResponse {
    static let EMPTY = WeatherResponse(weather: [], main: .init(temp: 0, temp_min: 0, temp_max: 0), name: "")
}

