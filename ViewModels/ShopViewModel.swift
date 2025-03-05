import SwiftUI

/// Manages the state and business logic for the Scale Cars Shop application.
///
/// - Properties:
///   - isLoggedIn: Tracks the user's authentication status
///   - cartItems: Stores the current items in the shopping cart
///   - showingCart: Controls the visibility of the cart view
///   - showLoginError: Indicates login failure
///   - showLogoutAlert: Controls the logout confirmation alert
///   - products: A predefined list of model car products

class ShopViewModel: ObservableObject {
    /// Indicates whether the user is currently logged in.
    @Published var isLoggedIn = false
    
    /// Stores the items currently in the shopping cart.
    @Published var cartItems: [CartItem] = []
    
    /// Controls the visibility of the cart view.
    @Published var showingCart = false
    
    /// Indicates whether a login error has occurred.
    @Published var showLoginError = false
    
    /// Controls the display of the logout confirmation alert.
    @Published var showLogoutAlert = false
    
    /// A predefined collection of model car products available in the shop.
        
    
    let products = [
        Product(name: "Porsche 911 GT3 RS", description: "Escala 1:18 - Color blanco", price: 129.99, imageUrl: "GTR3RS"),
        Product(name: "Ferrari F40", description: "Escala 1:24 - Clásico en Rojo Ferrari", price: 89.99, imageUrl: "FERRARIF40"),
        Product(name: "McLaren P1", description: "Escala 1:18 - Acabado en amarillo", price: 149.99, imageUrl: "MCLARENP1"),
        Product(name: "Bugatti Chiron", description: "Escala 1:18 - Edición Sport en Azul Royal", price: 159.99, imageUrl: "BUGATTICHIRON"),
        Product(name: "Lamborghini Aventador SVJ", description: "Escala 1:18 - Naranjo con detalles en fibra de carbono", price: 139.99, imageUrl: "AVENTADORSVJ"),
        Product(name: "Aston Martin Valkyrie", description: "Escala 1:24 - Gris Satinado con acentos rojos", price: 99.99, imageUrl: "ASTONMARTINVALKYRIE"),
        Product(name: "Mercedes-AMG GT Black Series", description: "Escala 1:18 - Gris satinado con detalles en rojo", price: 134.99, imageUrl: "AMGGT"),
        Product(name: "BMW M4 GT3", description: "Escala 1:18 - Decoración Motorsport", price: 119.99, imageUrl: "BMWM4GT3"),
        Product(name: "Pagani Huayra R", description: "Escala 1:18 - Tonos de plata con detalles en amarillo", price: 169.99, imageUrl: "PAGANIHUAYRAR"),
        Product(name: "Koenigsegg Jesko", description: "Escala 1:18 - Blanco Cherry Red", price: 159.99, imageUrl: "KoenigseggJesko"),
        Product(name: "Toyota GR Supra", description: "Escala 1:24 - All black ninja", price: 79.99, imageUrl: "ToyotaGRSupra"),
        Product(name: "Nissan GT-R Nismo", description: "Escala 1:18 - Black and white", price: 129.99, imageUrl: "NissanGT-RNismo"),
        Product(name: "Ford GT", description: "Escala 1:18 - Azul Liquid", price: 119.99, imageUrl: "FordGTHeritage"),
        Product(name: "Chevrolet Corvette C8", description: "Escala 1:24 - All black series", price: 84.99, imageUrl: "ChevroletCorvetteC8"),
        Product(name: "Dodge Challenger SRT Demon", description: "Escala 1:18 - Black Demon", price: 124.99, imageUrl: "DodgeChallengerSRTDemon"),
        Product(name: "Audi RS e-tron GT", description: "Escala 1:18 - Gris Daytona", price: 139.99, imageUrl: "AudiRSe-tronGT"),
        Product(name: "Porsche Taycan Turbo S", description: "Escala 1:24 - Azul Gentian", price: 89.99, imageUrl: "PorscheTaycanTurboS"),
        Product(name: "Tesla Model S Plaid", description: "Escala 1:18 - Snow White", price: 129.99, imageUrl: "TeslaModelSPlaid"),
        Product(name: "Rimac Nevera", description: "Escala 1:18 - Naranjo Satín", price: 149.99, imageUrl: "RimacNevera"),
        Product(name: "Alpine A110", description: "Escala 1:24 - Azul Alpine", price: 79.99, imageUrl: "AlpineA110"),
        Product(name: "Lexus LFA", description: "Escala 1:18 - Silver LFA", price: 144.99, imageUrl: "LexusLFA"),
        Product(name: "Honda NSX Type S", description: "Escala 1:24 - Gris Gotham", price: 89.99, imageUrl: "HondaNSXTypeS"),
        Product(name: "Maserati MC20", description: "Escala 1:18 - Naranjo Perlado", price: 134.99, imageUrl: "MaseratiMC20"),
        Product(name: "Lotus Evija", description: "Escala 1:18 - White and silver Lotus", price: 149.99, imageUrl: "LotusEvija"),
        Product(name: "Ferrari SF90 Stradale", description: "Escala 1:24 - Rojo Corsa Ferrari", price: 94.99, imageUrl: "FerrariSF90Stradale"),
        Product(name: "Lamborghini Sián", description: "Escala 1:18 - Naranjo Perlado", price: 159.99, imageUrl: "LamborghiniSián"),
        Product(name: "McLaren Speedtail", description: "Escala 1:18 - Plata Líquida", price: 154.99, imageUrl: "McLarenSpeedtail"),
        Product(name: "Porsche 918 Spyder", description: "Escala 1:24 - Plata Rhodium", price: 89.99, imageUrl: "Porsche918Spyder"),
        Product(name: "Bugatti Bolide", description: "Escala 1:18 - Negro Carbono/Azul", price: 169.99, imageUrl: "BugattiBolide"),
        Product(name: "Koenigsegg Gemera", description: "Escala 1:18 - Gris Antracita", price: 159.99, imageUrl: "KoenigseggGemera")
    ]
    
    /// Attempts to log in the user with the provided credentials.
       ///
       /// - Parameters:
       ///   - username: The user's username
       ///   - password: The user's password
       ///
       /// - Note: Currently uses a hardcoded credential check (User/Password)
       func login(username: String, password: String) {
           if username == "User" && password == "Password" {
               isLoggedIn = true
               showLoginError = false
           } else {
               showLoginError = true
           }
       }
       
       /// Logs out the current user and clears the cart.
       func logout() {
           isLoggedIn = false
           cartItems = []
       }
       
       /// Adds a product to the cart or increases its quantity if already present.
       ///
       /// - Parameter product: The product to be added to the cart
       func addToCart(product: Product) {
           if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
               cartItems[index].quantity += 1
           } else {
               cartItems.append(CartItem(product: product, quantity: 1))
           }
       }
       
       /// Removes a specific item from the cart.
       ///
       /// - Parameter cartItem: The cart item to be removed
       func removeFromCart(cartItem: CartItem) {
           cartItems.removeAll { $0.id == cartItem.id }
       }
       
       /// Updates the quantity of a specific cart item.
       ///
       /// - Parameters:
       ///   - cartItem: The cart item to update
       ///   - quantity: The new quantity for the item
       func updateQuantity(for cartItem: CartItem, quantity: Int) {
           if let index = cartItems.firstIndex(where: { $0.id == cartItem.id }) {
               cartItems[index].quantity = quantity
           }
       }
       
       /// Calculates the total price of all items in the cart.
       ///
       /// - Returns: The total price, accounting for item quantities
       var totalPrice: Double {
           cartItems.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
       }
   }
