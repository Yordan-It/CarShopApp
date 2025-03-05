import Foundation

/// Represents a product in the application, conforming to Identifiable protocol.
///
/// A `Product` encapsulates all the essential information about a single item
/// that can be added to a cart or displayed in a product list.
///
/// - Properties:
///   - id: A unique identifier for the product, automatically generated using UUID
///   - name: The name of the product
///   - description: A detailed description of the product
///   - price: The cost of the product
///   - imageUrl: A URL string pointing to the product's image
struct Product: Identifiable {
    /// A unique identifier for the product.
    ///
    /// Generated automatically using UUID, ensuring each product can be
    /// uniquely identified and referenced.
    let id = UUID()
    
    /// The name of the product.
    ///
    /// A human-readable identifier for the product, typically used in lists and displays.
    let name: String
    
    /// A detailed description of the product.
    ///
    /// Provides additional information about the product's features, specifications, or benefits.
    let description: String
    
    /// The price of the product.
    ///
    /// Represents the cost of the product, typically in the application's default currency.
    let price: Double
    
    /// A URL string pointing to the product's image.
    ///
    /// Can be used to fetch and display the product's visual representation.
    let imageUrl: String
}
