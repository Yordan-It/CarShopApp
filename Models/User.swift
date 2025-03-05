import Foundation

/// Represents a user in the application.
///
/// A `User` contains basic authentication credentials for user identification
/// and login purposes.
///
/// - Properties:
///   - username: The user's unique identifier for login
///   - password: The user's authentication credential
///
/// - Note: In a production environment, passwords should be securely hashed
/// and never stored in plain text.
struct User {
    /// The user's username.
    ///
    /// Used as the primary identifier for logging into the application.
    /// Should be unique across the user base.
    let username: String
    
    /// The user's password.
    ///
    /// - Warning: This is a basic implementation. In a real-world application,
    /// passwords should be securely hashed and never stored in plain text.
    /// Consider using secure authentication methods like OAuth or
    /// password hashing techniques.
    let password: String
}
