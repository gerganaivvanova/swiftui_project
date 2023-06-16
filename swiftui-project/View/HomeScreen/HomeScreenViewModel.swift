import SwiftUI
import Factory

class HomeScreenViewModel: ObservableObject {
    @Published var allProducts: [Product]=[]
    @Published var filteredProducts: [Product]=[]
    @Published var isLoading = false
    
    private let repository = Container.shared.productRepository()
    
    func fetchAllProducts(){
        isLoading = true
        Task{
            do {
                allProducts = try await repository.fetchProducts()
                self.filteredProducts = allProducts
            } catch {
                print("Error fetching all products data: \(error)")
            }
            isLoading = false
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
