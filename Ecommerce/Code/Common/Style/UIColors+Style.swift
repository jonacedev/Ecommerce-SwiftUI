

import Foundation
import UIKit

public extension UIColor {
        
    static var primaryApp: UIColor {
        UIColor(named: Colors.primaryApp.rawValue, in: .main, compatibleWith: nil) ?? UIColor()
    }

    static var secondaryApp: UIColor {
        UIColor(named: Colors.secondaryApp.rawValue, in: .main, compatibleWith: nil) ?? UIColor()
    }
}
