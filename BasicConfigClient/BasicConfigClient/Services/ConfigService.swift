//
//  ConfigService.swift
//  BasicConfigClient
//
//  Created by Michał Cichoń on 11/10/2020.
//

import UIKit

class ConfigService {
    
    static let shared = ConfigService()
    
    private let serverUrl: String
    private let defaults: UserDefaults
    private let notificationCenter: NotificationCenter
    
    convenience init() {
        let serverUrl = Constants.configServerUrl
        let defaults = UserDefaults.standard
        let notificationCenter = NotificationCenter.default
        self.init(serverUrl: serverUrl, defaults: defaults, notificationCenter: notificationCenter)
    }
    
    init(serverUrl: String, defaults: UserDefaults, notificationCenter: NotificationCenter) {
        self.serverUrl = serverUrl
        self.defaults = defaults
        self.notificationCenter = notificationCenter
        fetchConfig()
    }
    
    func string(key: String, defaultValue: String) -> String {
        return defaults.string(forKey: key) ?? defaultValue
    }
    
    func url(key: String, defaultValue: URL) -> URL {
        guard let string = defaults.string(forKey: key) else { return defaultValue }
        return URL(string: string) ?? defaultValue
    }
    
    func color(key: String, defaultValue: UIColor) -> UIColor {
        guard let string = defaults.string(forKey: key) else { return defaultValue }
        return UIColor(hexString: string) ?? defaultValue
    }
    
    // MARK: - Fetch data
    
    private func fetchConfig() {
        let baseUrl = URL(string: serverUrl)!
        let url: URL
        if let timestamp = Constants.timestamp {
            url = baseUrl.appendingPathComponent(DateFormatter.iso8601withFractionalSeconds.string(from: timestamp))
        } else {
            url = baseUrl
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data else { return }
            guard let self = self else { return }
            let decoded = self.decodedConfigs(data: data)
            self.update(configs: decoded)
        }
        
        task.resume()
    }
    
    // MARK: - Parse server response
    
    private func decodedConfigs(data: Data) -> [Config] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601withFractionalSeconds)
        return try! decoder.decode([Config].self, from: data)
    }
    
    // MARK: - Update configs
    
    private func update(configs: [Config]) {
        for config in configs {
            defaults.setValue(config.value, forKey: config.key)
        }
        
        notify()
    }
    
    // MARK: - Notify other objects
    
    private func notify() {
        notificationCenter.post(name: .didUpdateConfig, object: nil)
    }
    
}

fileprivate extension ConfigService {
    struct Constants {
        static let configServerUrl = "http://localhost:3000/config"
        static var timestamp: Date? { UserDefaults.standard.object(forKey: "last_timestamp") as? Date }
    }
}

extension Notification.Name {
    static let didUpdateConfig = Notification.Name("didUpdateConfig")
}
