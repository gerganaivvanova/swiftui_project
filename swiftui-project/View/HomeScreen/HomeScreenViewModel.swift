import SwiftUI
import Factory

class HomeScreenViewModel: ObservableObject {
    @Published var allProducts: [Product]
    @Published var filteredProducts: [Product] = []
    
    private let repository = Container.shared.productRepository()
    
    init(allProducts: [Product]) {
        self.allProducts = allProducts
        self.filteredProducts = allProducts
    }
    
    func fetchAllProducts(){
        Task{
            do {
                allProducts = try await repository.fetchProducts()
                filteredProducts = allProducts
            } catch {
                print("Error fetching all products data: \(error)")
            }
        }
    }
    
    func filterProducts(by searchText: String) {
        if searchText.isEmpty {
            filteredProducts = allProducts
        } else {
            filteredProducts = allProducts.filter { product in
                product.title.localizedCaseInsensitiveContains(searchText)
                || product.shortDescription.localizedCaseInsensitiveContains(searchText)
            }
       }
    }
}
