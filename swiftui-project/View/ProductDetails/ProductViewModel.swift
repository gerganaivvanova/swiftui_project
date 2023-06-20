import SwiftUI
import Factory

class ProductViewModel: ObservableObject {
    @Published var product: Product?
    
    private let repository = Container.shared.productRepository()
    
    func fetchProductDetails(productId: Int){
        Task{
            do {
                product = try await repository.fetchProductDetails(id: productId)
            } catch {
                print("Error fetching product details: \(error)")
            }
        }
    }
    
}
