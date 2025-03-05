import SwiftUI

/// Displays the list of available products in a grid layout.
///
/// `ProductListView` provides a visually appealing interface for browsing
/// model car products, with navigation options for cart and logout.
struct ProductListView: View {
    /// The view model managing products, cart, and user state.
    @ObservedObject var viewModel: ShopViewModel
    
    /// Defines the layout and content of the product list screen.
    ///
    /// Includes:
    /// - Dark gradient background
    /// - Scrollable grid of product cards
    /// - Navigation bar with cart and logout options
    /// - Logout confirmation alert
    var body: some View {
        NavigationStack {
            ZStack {
                // Gradient background with multiple color stops
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.black,
                        Color(white: 0.1),
                        Color(white: 0.2),
                        Color(white: 0.1),
                        Color.black
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                // Scrollable grid of products
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(viewModel.products) { product in
                            ProductCard(product: product, viewModel: viewModel)
                        }
                    }
                    .padding()
                }
            }
            // Navigation bar customization
            .navigationTitle("Productos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                // Cart menu item
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        CartView(viewModel: viewModel)
                    } label: {
                        Image(systemName: "cart")
                            .foregroundColor(.white)
                    }
                }
                
                // Logout button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.showLogoutAlert = true
                    }) {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(.white)
                    }
                }
            }
            // Logout confirmation alert
            .alert("Cerrar sesión", isPresented: $viewModel.showLogoutAlert) {
                Button("Cancelar", role: .cancel) {}
                Button("Cerrar sesión", role: .destructive) {
                    viewModel.logout()
                }
            } message: {
                Text("¿Estás seguro de que quieres cerrar sesión?")
            }
        }
    }
}


