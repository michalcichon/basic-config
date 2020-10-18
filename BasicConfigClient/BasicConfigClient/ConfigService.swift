//
//  ConfigService.swift
//  BasicConfigClient
//
//  Created by Michał Cichoń on 11/10/2020.
//

import UIKit

class ConfigService {
    
    static let shared = ConfigService(serverUrl: Constants.configServerUrl)
    
    struct Constants {
        static let configServerUrl = "http://localhost:3000/config"
        static var timestamp: Date? { UserDefaults.standard.object(forKey: "last_timestamp") as? Date }
    }
    
    struct Config: Codable {
        let key: String
        let value: String
        let updated_at: Date
    }
    
    init(serverUrl: String) {
        let baseUrl = URL(string: serverUrl)!
        let url = baseUrl.appendingPathComponent("2020-10-11T20:55:16.000Z")
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    func string(key: String, defaultValue: String) -> String {
        return defaultValue
    }
    
    func url(key: String, defaultValue: URL) -> URL {
        return defaultValue
    }
    
    func color(key: String, defaultValue: UIColor) -> UIColor {
        return defaultValue
    }
    
    // MARK: - Parse server response
    
    
    
    // MARK: - Update configs
    
}
