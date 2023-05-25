//
//  Entity.swift
//  iOS_MvvmPattern_Study_02
//
//  Created by 여성일 on 2023/05/22.
//

import Foundation

struct GroupResponse: Codable {
    let list: [WeatherResponse]
}

struct WeatherResponse: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Weather: Codable {
    let main: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

extension GroupResponse {
    static let EMPTY = GroupResponse(list: [])
}

