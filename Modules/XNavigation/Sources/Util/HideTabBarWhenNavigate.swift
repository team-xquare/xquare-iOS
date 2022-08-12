import SwiftUI

import Introspect

struct HideTabBarWhenNavigateModifier: ViewModifier {

    @State var uiTabBarController: UITabBarController?
    var isRootNow: Bool

    func body(content: Content) -> some View {
        content
            .introspectTabBarController { (UITabBarController) in
                uiTabBarController = UITabBarController
                uiTabBarController?.tabBar.isHidden = true
            }.onChangePresentationMode { isPresented in
                guard isRootNow && !isPresented else { return }
                uiTabBarController?.tabBar.isHidden = false
            }
    }

}

extension View {
    func hideTabBarWhenNaviagte(isRootNow: Bool) -> some View {
        self.modifier(HideTabBarWhenNavigateModifier(isRootNow: isRootNow))
    }
}
