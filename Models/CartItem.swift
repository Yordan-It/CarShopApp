import Foundation

/// Represents an item in the shopping cart, conforming to Identifiable protocol.
///
/// A `CartItem` combines a product with its specific quantity in the cart,
/// providing a unique identifier for each cart entry.
///
/// - Properties:
///   - id: A unique identifier for the cart item, automatically generated using UUID
///   - product: The specific product added to the cart
///   - quantity: The number of this product in the cart
struct CartItem: Identifiable {
    /// A unique identifier for the cart item.
    ///
    /// Generated automatically using UUID, ensuring each cart item can be
    /// uniquely identified and tracked.
    let id = UUID()
    
    /// The product added to the cart.
    ///
    /// Contains all details about the specific product, such as name, price, and description.
    let product: Product
    
    /// The quantity of the product in the cart.
    ///
    /// Represents how many of this specific product the user wants to purchase.
    /// Can be modified to adjust the number of items.
    var quantity: Int
}
