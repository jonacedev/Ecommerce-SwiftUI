//
//  Number+Utils.swift
//  Ecommerce
//
//  Created by Jonathan Miguel Onrubia Solis on 5/4/24.
//

import Foundation

extension NSNumber {
    
    //    func toString(from locale: Locale = Locale(identifier: "es_ES"), minDigits: Int = 2, maxDigits: Int = 2, usesGroupingSeparator: Bool = true) -> String {
    
    func toString(from locale: Locale = Locale(identifier: "fr_FR"), minFractionDigits: Int = 2, maxFractionDigits: Int = 12, usesGroupingSeparator: Bool = true) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = locale
        formatter.usesGroupingSeparator = usesGroupingSeparator
        formatter.minimumFractionDigits = minFractionDigits
        formatter.maximumFractionDigits = maxFractionDigits
        formatter.groupingSeparator = "."
        
        return formatter.string(from: self) ?? ""
    }
}
