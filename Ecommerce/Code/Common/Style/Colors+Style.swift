

import SwiftUI

internal enum Colors: String {
    case primaryApp = "primaryBrand"
    case secondaryApp = "secondaryBrand"
}

extension Color {
    
    public static var primaryApp: Color {
        Color(Colors.primaryApp.rawValue, bundle: Bundle.main)
    }
    
    public static var secondaryApp: Color {
        Color(Colors.secondaryApp.rawValue, bundle: Bundle.main)
    }
}

