


import Combine
import Foundation

enum TabSelection: Int {
    case home = 0
    case favorites = 1
    case checkout = 2
}

final class MainTabBarViewModel: BaseViewModel {

    // MARK: - Properties
    
    @Published var tabSelection: Int = TabSelection.home.rawValue

    // MARK: - Functions
    
    func readyTab() {
        tabSelection = tabSelection
    }
}
