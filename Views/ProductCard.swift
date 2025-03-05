import SwiftUI

/// Represents a single product card in the product list.
///
/// `ProductCard` displays detailed information about a product
/// and provides an "Add to Cart" interaction with a subtle animation.
struct ProductCard: View {
    /// The product to be displayed in this card.
    let product: Product
    
    /// The view model managing cart and product operations.
    @ObservedObject var viewModel: ShopViewModel
    
    /// Tracks the press state for animation purposes.
    @State private var isPressed = false
    
    /// Defines the layout and content of the product card.
    ///
    /// Includes:
    /// - Product image
    /// - Product name and description
    /// - Price
    /// - "Add to Cart" button with press animation
    var body: some View {
        VStack {
            // Product image
            Image(product.imageUrl)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(10)
                .padding(.top, 5)
            
            // Product details
            Text(product.name)
                .font(.headline)
                .foregroundColor(.white)
            
            Text(product.description)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 5)
            
            Text("$\(product.price, specifier: "%.2f")")
                .font(.subheadline)
                .bold()
                .foregroundColor(.white)
            
            // Add to Cart button with press animation
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    isPressed = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        isPressed = false
                    }
                    viewModel.addToCart(product: product)
                }
            }) {
                Text("Añadir al carrito")
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black.opacity(0.8), Color.gray.opacity(0.8)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(8)
            }
            .scaleEffect(isPressed ? 0.95 : 1.0)
        }
        .padding()
        .background(
            Color.black.opacity(0.7)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
        )
    }
}
