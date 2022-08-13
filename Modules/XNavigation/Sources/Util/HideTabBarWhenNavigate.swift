import SwiftUI

import Introspect

struct HideTabBarWhenNavigateModifier: ViewModifier {

    @Environment(\.presentationMode) var presentationMode
    @State var uiTabBarController: UITabBarController?
    var isRootNow: Bool

    func body(content: Content) -> some View {
        content
            .introspectTabBarController { (UITabBarController) in
                uiTabBarController = UITabBarController
                uiTabBarController?.tabBar.isHidden = true
            }
            .onDisappear {
                guard isRootNow && !presentationMode.wrappedValue.isPresented else { return }
                uiTabBarController?.tabBar.isHidden = false
            }
            .padding(.bottom, -(uiTabBarController?.tabBar.frame.height ?? 0))
    }

}

extension View {
    func hideTabBarWhenNaviagte(isRootNow: Bool) -> some View {
        self.modifier(HideTabBarWhenNavigateModifier(isRootNow: isRootNow))
    }
}
