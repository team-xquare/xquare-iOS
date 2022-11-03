import SwiftUI

public extension View {
    func xPhotoPicker(isPresented: Binding<Bool>, selection: Binding<[UIImage]>) -> some View {
        self.modifier(XPhotoPickerModifier(isPresented: isPresented, selection: selection))
    }
    func xPhotoPicker(isPresented: Binding<Bool>, selection: Binding<UIImage>) -> some View {
        self.modifier(XPhotoPickerModifier(isPresented: isPresented, selection: selection))
    }
}
