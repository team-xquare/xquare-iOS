import Foundation
import SwiftUI

extension View {
    @ViewBuilder func present<Content: View>(
        asSheet: Bool,
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        if asSheet {
            self.sheet(
                isPresented: isPresented,
                onDismiss: nil,
                content: content
            )
        } else {
            self.fullScreenCover(
                isPresented: isPresented,
                onDismiss: nil,
                content: content
            )
        }
    }
}
