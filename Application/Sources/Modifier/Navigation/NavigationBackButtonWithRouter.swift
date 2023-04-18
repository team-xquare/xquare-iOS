import SwiftUI

import SemicolonDesign

struct NavigationBackButtonWithRouter: ViewModifier {
    @EnvironmentObject var xquareRouter: XquareRouter
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.xquareRouter.dismissLast()
                    } label: {
                        Image("BackButton")
                            .font(.system(size: 24))
                            .tint(.GrayScale.gray200)
                    }
                }
            }
    }
}

extension View {
    func setNavigationBackButtonWithRouter() -> some View {
        self.modifier(NavigationBackButton())
    }
}
