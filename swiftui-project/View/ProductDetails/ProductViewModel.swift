import SwiftUI
import Factory

class ProductViewModel: ObservableObject {
    @Published var product: Product?
    
    private let repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol = ProductRepository()){
        self.repository = repository
    }
    
    func fetchProductDetails(){
        Task{
            do {
                product = try await repository.fetchProductDetails(id: 15)
                print(product! as Product)
            } catch {
                print("Error fetching product details: \(error)")
            }
        }
    }
    
}
