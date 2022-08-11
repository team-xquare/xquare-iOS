import SwiftUI

extension View {
    func onChangePresentationMode(_ perform: @escaping (_ isPresented: Bool) -> Void) -> some View {
        self.modifier(ChangePresentationModeModifier(callback: perform))
    }
}

struct ChangePresentationModeModifier: ViewModifier {

    @Environment(\.presentationMode) var presentationMode
    let callback: (_ isPresented: Bool) -> Void

    func body(content: Content) -> some View {
        content
            .onChange(of: presentationMode.wrappedValue.isPresented) {
                callback($0)
            }
    }
}
