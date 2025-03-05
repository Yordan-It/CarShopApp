import SwiftUI

struct CarbonFiberPattern: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Black background
                Color.black
                
                // Carbon fiber pattern
                VStack(spacing: 0) {
                    ForEach(0..<Int(geometry.size.height/10), id: \.self) { _ in
                        HStack(spacing: 0) {
                            ForEach(0..<Int(geometry.size.width/10), id: \.self) { _ in
                                RoundedRectangle(cornerRadius: 1)
                                    .fill(
                                        RadialGradient(
                                            gradient: Gradient(colors: [
                                                Color.gray.opacity(0.3),
                                                Color.black.opacity(0.8)
                                            ]),
                                            center: .center,
                                            startRadius: 0,
                                            endRadius: 5
                                        )
                                    )
                                    .frame(width: 10, height: 10)
                            }
                        }
                    }
                }
                .rotationEffect(.degrees(45))
                .scaleEffect(1.5)
                
                Color.white.opacity(0.1)
            }
        }
        .ignoresSafeArea()
    }
}
