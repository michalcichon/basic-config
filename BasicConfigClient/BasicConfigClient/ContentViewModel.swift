//
//  ContentViewModel.swift
//  BasicConfigClient
//
//  Created by Michał Cichoń on 11/10/2020.
//

import UIKit

class ContentViewModel: ObservableObject {
    
    var buttonText: String { ConfigService.shared.string(key: "app.fun_button.text", defaultValue: "Dogs are awesome!") }
    var buttonURL: URL { ConfigService.shared.url(key: "app.fun_button.url", defaultValue: URL(string: "https://www.google.com/search?query=dogs%20are%20awesome")!) }
    var backgroundColor: UIColor { ConfigService.shared.color(key: "app.background.color", defaultValue: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) }
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(onConfigUpdate), name: .didUpdateConfig, object: nil)
    }
    
    @objc func onConfigUpdate() {
        DispatchQueue.main.async { [weak self] in
            self?.objectWillChange.send()
        }
    }
    
}
