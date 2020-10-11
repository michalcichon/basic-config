//
//  ContentViewModel.swift
//  BasicConfigClient
//
//  Created by Michał Cichoń on 11/10/2020.
//

import UIKit

class ContentViewModel: ObservableObject {
    var buttonText = ConfigService.shared.string(key: "app.fun_button.text", defaultValue: "Test me!")
    var buttonURL = ConfigService.shared.url(key: "app.fun_button.url", defaultValue: URL(string: "https://www.google.com")!)
    var backgroundColor = ConfigService.shared.color(key: "app.background.color", defaultValue: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
}
