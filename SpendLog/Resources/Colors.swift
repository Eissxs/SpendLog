//
//  Colors.swift
//  SpendLog
//
//  Created by Michael Eissen San Antonio on 5/4/25.
//

import SwiftUI

extension Color {
    static let backgroundBeige = Color(hex: "d8e2dc")
    static let accentOrangeRed = Color(hex: "#ff7043")
    static let textGrey = Color(hex: "#37474f")
    static let savingGreen = Color(hex: "#aed581")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        
        self.init(red: r, green: g, blue: b)
    }
}
