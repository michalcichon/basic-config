//
//  ConfigService.swift
//  BasicConfigClient
//
//  Created by Michał Cichoń on 11/10/2020.
//

import UIKit

class ConfigService {
    
    static let shared = ConfigService()
    
    func string(key: String, defaultValue: String) -> String {
        return defaultValue
    }
    
    func url(key: String, defaultValue: URL) -> URL {
        return defaultValue
    }
    
    func color(key: String, defaultValue: UIColor) -> UIColor {
        return defaultValue
    }
    
}
