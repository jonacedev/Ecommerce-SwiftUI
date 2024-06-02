


import Combine
import Foundation

final class HomeViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    @Published var searchText: String = ""
    @Published var favorites: [Product] = []
    private var dataManager: HomeDataManager
    
    var products: [Product] = []
    var user: User?
    
    init(navigationManager: any NavigationManagerProtocol, dataManager: HomeDataManager) {
        self.dataManager = dataManager
        super.init(navigationManager: navigationManager)
    }
    
    // MARK: - Private Functions
    
    func loadAllData() {
        getProductsList()
        getFavoritesList()
        getDefaultUser()
    }
    
    func getProductsList() {
        showLoading()
        dataManager.getProductsList()
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] completion in
                self?.manage(completion: completion)
            } receiveValue: { [weak self] response in
                self?.hideLoading()
                self?.products = response.products ?? []
            }.store(in: &cancellables)
    }
    
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
    
    func getDefaultUser() {
        showLoading()
        dataManager.getDefaultUser()
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] completion in
                self?.manage(completion: completion)
            } receiveValue: { [weak self] response in
                self?.hideLoading()
                self?.user = response.data
            }.store(in: &cancellables)
    }
    
    func filteredProducts() -> [Product] {
        searchText.isEmpty ? products : products.filter { ($0.title ?? "").localizedCaseInsensitiveContains(searchText) }
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
        } else {
            dataManager.addFavorite(id: id ?? "")
                .receive(on: DispatchQueue.main)
                .sink{ [weak self] completion in
                    self?.manage(completion: completion)
                } receiveValue: { [weak self] response in
                    self?.navigationManager.hideLoading()
                    self?.updateFavorites(isCurrentlyFavorite: false, id: id)
                }.store(in: &cancellables)
        }
    }
    
    private func updateFavorites(isCurrentlyFavorite: Bool, id: String?) {
        if isCurrentlyFavorite {
            favorites.removeAll { $0.id == id }
        } else {
            if let newFavorite = products.first(where: { $0.id == id }) {
                favorites.append(newFavorite)
            }
        }
    }
    
    func goDetail(product: Product) {
        navigationManager.push(.productDetail(product: product))
    }
}
