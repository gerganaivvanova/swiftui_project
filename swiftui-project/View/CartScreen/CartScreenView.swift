//
//  CartButton.swift
//  swiftui-project
//
//  Created by user238749 on 6/9/23.
//
import SwiftUI

struct CartScreenView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var navigateToHome = false
    @State private var showAlert = false
    
    var total: Double {
        Double(cartManager.cart.reduce(0) { $0 + $1.price })
        }
    
    var body: some View {
            if cartManager.cart.isEmpty {
                EmptyCartView()
            } else {
                VStack(alignment: .leading){
                    ForEach(cartManager.cart, id: \.id){ product in
                        CartItem(product: product)
                    }
                    .onDelete(perform: { indexSet in
                        cartManager.cart.remove(atOffsets: indexSet)
                    })
                    
                    HStack{
                        Text("Items: \(cartManager.cart.count)")
                        Spacer()
                        Text("Total: \(String(format: "%.2f", total))")
                    }
                    Spacer()
                    Button(action: {showAlert = true}, label: {
                        Text("Check out")
                            .foregroundColor(.white)
                            .padding(.vertical, UIConstants.smallPadding)
                            .frame(maxWidth: .infinity)
                            .background(Color("TextColor"))
                            .cornerRadius(UIConstants.mediumCornerRadius)
                    })
                    .padding(.horizontal, UIConstants.bigPadding)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Are you sure?"),
                            message: Text("Are you sure you want to proceed to check out?"),
                            primaryButton: .default(Text("Yes"), action: {
                                checkout()
                            }),
                            secondaryButton: .cancel(Text("No"))
                        )
                    }
                }
                .padding(UIConstants.bigPadding)
                .background(
                    Image("HomeScreenBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                )
                .navigationDestination(isPresented: $navigateToHome, destination: {HomeScreenView()})
                .toolbar{
                    ToolbarItem(placement: .principal){
                        Text("Cart")
                    }
                }
            }
    }
    
    func checkout() {
        let order = Order(id: cartManager.orderHistory.count + 1, products: cartManager.cart, date: Date(), total: total)
        cartManager.orderHistory.append(order)
        navigateToHome = true
        cartManager.cart.removeAll()
    }
}
