import SwiftUI

/// Provides the login interface for the Scale Cars Shop application.
///
/// `LoginView` handles user authentication with a custom-styled interface
/// featuring a carbon fiber background, logo, and login form.
struct LoginView: View {
    /// The view model managing authentication and app state.
    @StateObject var viewModel = ShopViewModel()
    
    /// Stores the entered username for two-way binding.
    @State private var username = ""
    
    /// Stores the entered password for two-way binding.
    @State private var password = ""
    
    /// Defines the layout and content of the login screen.
    ///
    /// Includes:
    /// - Carbon fiber background
    /// - App icon and title
    /// - Welcome messages
    /// - Username and password text fields
    /// - Login error handling
    /// - Login button with gradient styling
    /// - Navigation to product list upon successful login
    var body: some View {
        NavigationStack {
            ZStack {
                // Custom background pattern
                CarbonFiberPattern()
                
                VStack(spacing: 20) {
                    // App icon and branding
                    Image("Icon")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                    
                    Text("Scale Cars Shop")
                        .italic()
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    
                    // Welcome messages
                    Text("¡Bienvenido/a!")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .padding()
                    
                    Text("Inicia sesión para continuar")
                        .font(.headline)
                        .fontWeight(.ultraLight)
                        .foregroundColor(.white)
                        .padding()
                    
                    // Login form
                    VStack(spacing: 15) {
                        TextField("Usuario", text: $username)
                            .textFieldStyle(CustomTextFieldStyle())
                            .padding(.vertical)
                        
                        SecureField("Contraseña", text: $password)
                            .textFieldStyle(CustomTextFieldStyle())
                            .padding(.vertical)
                        
                        // Login error message
                        if viewModel.showLoginError {
                            Text("Usuario o contraseña incorrectos")
                                .foregroundColor(.red)
                                .font(.caption)
                                .transition(.opacity)
                        }
                        
                        // Login button
                        Button(action: {
                            viewModel.login(username: username, password: password)
                        }) {
                            Text("Iniciar sesión")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.gray.opacity(0.8), Color.black]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                )
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                    .background(
                        Color.black.opacity(0.7)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
                            )
                    )
                    .padding(.horizontal)
                }
            }
            // Navigation to product list upon successful login
            .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                ProductListView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    LoginView()
}
