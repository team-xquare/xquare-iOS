import SwiftUI

import SemicolonDesign

struct NavigationBackButton: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image("BackButton")
                            .font(.system(size: 24))
                            .tint(.GrayScale.gray200)
                    })
                }
            }
    }
}

extension View {
    func setNavigationBackButton() -> some View {
        modifier(NavigationBackButton())
    }
}
