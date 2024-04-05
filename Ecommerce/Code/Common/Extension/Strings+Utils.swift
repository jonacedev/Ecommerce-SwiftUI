//
//  Strings+Utils.swift
//  PokeApp
//
//  Created by Jonathan Onrubia Solis on 20/3/24.
//

import Foundation

extension String {
    
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    var removeWhitespaces: String {
        return replacingOccurrences(of: " ", with: "")
    }

    func formatPhone(separator: String = " ") -> String {
        if count != 9 {
            return self
        } else {
            return components(separatedBy: separator).joined().splitString(batchSize: 3).map { String($0) }.joined(separator: separator)
        }
    }

    func formatIban(separator: String = " ") -> String {
        return components(separatedBy: separator).joined().splitString(batchSize: 4).map { String($0) }.joined(separator: separator).uppercased()
    }

    var addPercent: String {
        return "\(self)%"
    }

    func splitString(batchSize: Int) -> [SubSequence] {
        var remainderIndex = startIndex
        var result: [SubSequence] = []
        while remainderIndex < endIndex {
            let batchEndIndex = index(remainderIndex, offsetBy: batchSize, limitedBy: endIndex) ?? endIndex
            result.append(self[remainderIndex..<batchEndIndex])
            remainderIndex = batchEndIndex
        }
        return result
    }
    
    static func convertDoubleToString(_ value: Double?, minFractionDigits: Int = 2, maxFractionDigits: Int = 2, stringIfNil: String? = nil) -> String {
        if let num = value {
            return NSNumber(value: num).toString(minFractionDigits: minFractionDigits, maxFractionDigits: maxFractionDigits)
        }
        return stringIfNil ?? ""
    }
}
