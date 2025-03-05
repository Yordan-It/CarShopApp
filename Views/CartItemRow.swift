import SwiftUI

/// Represents a single row in the shopping cart view.
///
/// `CartItemRow` displays detailed information about a cart item,
/// including its image, name, description, price, and quantity controls.
struct CartItemRow: View {
    /// The cart item to be displayed in this row.
    let cartItem: CartItem
    
    /// The view model managing the cart and its operations.
    @ObservedObject var viewModel: ShopViewModel
    
    /// Defines the layout and content of the cart item row.
    ///
    /// Includes:
    /// - Product image
    /// - Product details (name, description, price)
    /// - Quantity stepper
    /// - Remove from cart button
    var body: some View {
        HStack {
            // Product image with resizing and corner radius
            Image(cartItem.product.imageUrl)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .cornerRadius(8)
            
            // Product details stack
            VStack(alignment: .leading) {
                Text(cartItem.product.name)
                    .font(.headline)
                Text(cartItem.product.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("$\(cartItem.product.price, specifier: "%.2f")")
                    .font(.subheadline)
            }
            
            Spacer()
            
            // Quantity stepper with two-way binding to view model
            Stepper(
                value: Binding(
                    get: { cartItem.quantity },
                    set: { viewModel.updateQuantity(for: cartItem, quantity: $0) }
                ),
                in: 1...10
            ) {
                Text("\(cartItem.quantity)")
            }
            
            // Remove item button
            Button(action: {
                viewModel.removeFromCart(cartItem: cartItem)
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
    }
}

