import SwiftUI

public extension View {
    func xPhotoViewer(isPresented: Binding<Bool>, images: [URL]) -> some View {
        self.fullScreenCover(isPresented: isPresented) {
            XPhotoViewer(images: images)
        }
    }
}
