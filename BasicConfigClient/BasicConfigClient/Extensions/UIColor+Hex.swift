//
//  UIColor+Hex.swift
//  BasicConfigClient
//
//  Created by Michał Cichoń on 18/10/2020.
//

import UIKit

extension UIColor {
    convenience init?(hexString: String) {
        let string = hexString.replacingOccurrences(of: "#", with: "")
        guard string.count == 6 else { return nil }
        var rgbValue: UInt64 = 0
        Scanner(string: string).scanHexInt64(&rgbValue)
        let red = (rgbValue & 0xFF0000) >> 16
        let green = (rgbValue & 0x00FF00) >> 8
        let blue = rgbValue & 0x0000FF
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(1.0))
    }
}
