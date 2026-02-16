import SwiftUI

struct NavigationTitle: ViewModifier {
    let title: String
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(color)
                }
            }
    }
}

extension View {
    func navigationTitle(_ title: String, _ color: Color) -> some View {
        modifier(NavigationTitle(title: title, color: color))
    }
}
