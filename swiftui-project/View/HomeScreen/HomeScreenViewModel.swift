import SwiftUI
import Factory

class HomeScreenViewModel: ObservableObject {
    @Published var allProducts: [Product]=[]
    @Published var isLoading = false
    @Published var filteredProducts: [Product] = []
    @Published var selectedCategories: Set<String> = []
    @Published var selectedRating: Int = 0
    @Published var calculatedPriceRange: ClosedRange<Double> = 0...0
    @Published var selectedPriceRange: ClosedRange<Double> = 0...0
    @Published var appliedFilterCount = 0
    
    init() {
        filteredProducts = allProducts
        calculatePriceRange()
    }
    
    private let repository = Container.shared.productRepository()
    
    func fetchAllProducts(){
        isLoading = true
        Task{
            do {
                allProducts = try await repository.fetchProducts()

            } catch {
                print("Error fetching all products data: \(error)")
            }
            filteredProducts = allProducts
            isLoading = false
            calculatePriceRange()
        }
    }
    
    func searchProducts(by searchText: String){
        if searchText.isEmpty {
            filteredProducts = allProducts
        } else {
            filteredProducts = allProducts.filter { product in
                product.title.localizedCaseInsensitiveContains(searchText)
                || product.shortDescription.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    private func calculatePriceRange() {
               
        let smallestPrice = filteredProducts.min(by: { $0.price < $1.price })?.price ?? 0
        let bigestPrice = filteredProducts.max(by: { $0.price < $1.price })?.price ?? 0
        
        calculatedPriceRange = Double(smallestPrice)...Double(bigestPrice)
    }
    
    func applyFilters() {
        let isPriceRangeSelected = selectedPriceRange.lowerBound != calculatedPriceRange.lowerBound || selectedPriceRange.upperBound != calculatedPriceRange.upperBound
        
        if !selectedCategories.isEmpty || selectedRating > 0 || isPriceRangeSelected {
            filteredProducts = allProducts.filter{product in
                let categoryFilter = selectedCategories.isEmpty || selectedCategories.contains(product.category)
                let ratingFilter = selectedRating == 0 || product.rating == selectedRating
              let priceRangeFilter = selectedPriceRange.lowerBound...selectedPriceRange.upperBound ~= Double(product.price)
                
                appliedFilterCount = (selectedCategories.isEmpty ? 0 : 1) + (selectedRating > 0 ? 1 : 0) + (isPriceRangeSelected ? 1 : 0)
                
                return categoryFilter && ratingFilter && priceRangeFilter
            }
        } else {
        filteredProducts = allProducts
        }
    }
    
    func filterByRating(_ rating: Int) {
        selectedRating = rating
        applyFilters()
    }
}
