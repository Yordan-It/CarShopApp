import SwiftUI

/// Displays the contents of the shopping cart.
///
/// `CartView` shows a list of cart items or a message if the cart is empty.
/// It also displays the total price and a checkout button.
struct CartView: View {
    /// The view model managing the cart and its operations.
    @ObservedObject var viewModel: ShopViewModel
    
    /// Defines the layout and content of the cart view.
    ///
    /// Includes:
    /// - Empty cart message when no items are present
    /// - List of cart items using `CartItemRow`
    /// - Total price calculation
    /// - Checkout button (currently without implementation)
    var body: some View {
        VStack {
            // Conditional rendering based on cart contents
            if viewModel.cartItems.isEmpty {
                Text("El carrito está vacío")
                    .padding()
            } else {
                // Scrollable list of cart items
                ForEach(viewModel.cartItems) { item in
                    CartItemRow(cartItem: item, viewModel: viewModel)
                }
                
                Divider()
                
                // Total price and checkout section
                HStack {
                    Text("Total: $\(viewModel.totalPrice, specifier: "%.2f")")
                        .font(.headline)
                    
                    Button(action: {
                        // Placeholder for future payment logic
                        print("Ir a pagar")
                    }) {
                        Text("Ir a pagar")
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
        }
    }
}
