


import Combine
import Foundation

final class FavoritesViewModel: BaseViewModel {

    @Published var favorites: [Product] = []
    private var dataManager: FavoritesDataManager
    private var navigationManager: NavigationManager
    
    init(navigationManager: NavigationManager, rootManager: RootManager, dataManager: FavoritesDataManager) {
        self.navigationManager = navigationManager
        self.dataManager = dataManager
        super.init(rootManager: rootManager)
    }

    // MARK: - Functions
    
    func getFavoritesList() {
        showLoading()
        dataManager.getFavoritesList()
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] completion in
                self?.manage(completion: completion)
            } receiveValue: { [weak self] response in
                self?.hideLoading()
                self?.favorites = response.favorites ?? []
            }.store(in: &cancellables)
    }
    
    func isFavorite(id: String?) -> Bool {
        favorites.contains(where: { $0.id == id })
    }
    
    func tapFavorite(id: String?) {
        showLoading()
        if isFavorite(id: id) {
            dataManager.deleteFavorite(id: id ?? "")
                .receive(on: DispatchQueue.main)
                .sink{ [weak self] completion in
                    self?.manage(completion: completion)
                } receiveValue: { [weak self] response in
                    self?.hideLoading()
                    self?.updateFavorites(isCurrentlyFavorite: true, id: id)
            }.store(in: &cancellables)
        }
    }
    
    private func updateFavorites(isCurrentlyFavorite: Bool, id: String?) {
        if isCurrentlyFavorite {
            favorites.removeAll { $0.id == id }
        }
    }
    
    func goDetail(product: Product) {
        navigationManager.push(.productDetail(product: product))
    }
}
