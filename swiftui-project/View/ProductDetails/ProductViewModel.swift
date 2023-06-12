import SwiftUI
import Factory

class ProductViewModel: ObservableObject {
    @Published var product: Product?
    
    private let repository = Container.shared.productRepository()
    
    func fetchProductDetails(){
        Task{
            do {
                product = try await repository.fetchProductDetails(id: 15)
            } catch {
                print("Error fetching product details: \(error)")
            }
        }
    }
    
}
