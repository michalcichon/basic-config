//
//  Config.swift
//  BasicConfigClient
//
//  Created by Michał Cichoń on 18/10/2020.
//

import Foundation

struct Config: Codable {
    let key: String
    let value: String
    let updated_at: Date
}
