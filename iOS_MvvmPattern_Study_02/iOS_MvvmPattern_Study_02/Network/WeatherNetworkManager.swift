//
//  WeatherNetworkManager.swift
//  iOS_MvvmPattern_Study_02
//
//  Created by 여성일 on 2023/05/22.
//

import Foundation

class WeatherNetworkManager {
    static let shared = WeatherNetworkManager()
    
    init() { }
    
    private let api = WeatherAPI()
    private let session = URLSession(configuration: .default)

    var searchedData: WeatherResponse = WeatherResponse.EMPTY

    func getWeatherItem(query: String, completion: @escaping (WeatherResponse) -> Void) {

        guard let url = api.getAPI(query: query, apiId: ApiKey.ApiKey).url else {
            return
        }

        session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let hasData = try JSONDecoder().decode(WeatherResponse.self, from: data)
                self.searchedData = hasData
                print(self.searchedData)
                completion(self.searchedData)
            } catch let error as NSError {
                print("err \(error)")
                return
            }
        }.resume()
    }
}

