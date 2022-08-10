import SwiftUI

import Introspect

public struct XNavigationLinkWithoutTabBar<Label, Destination>: View where Label: View, Destination: View {

    @State var uiTabarController: UITabBarController?

    var isActive: Binding<Bool>?
    var destination: () -> Destination
    var label: () -> Label

    public init(@ViewBuilder destination: @escaping () -> Destination,
                @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label
    }

    public init(isActive: Binding<Bool>,
                @ViewBuilder destination: @escaping () -> Destination,
                @ViewBuilder label: @escaping () -> Label) {
        self.isActive = isActive
        self.destination = destination
        self.label = label
    }

    public var body: some View {
        if let isActive = isActive {
            NavigationLink(
                isActive: isActive,
                destination: {
                    destination()
                        .introspectTabBarController { (UITabBarController) in
                            UITabBarController.tabBar.isHidden = true
                            uiTabarController = UITabBarController
                        }.onDisappear {
                            uiTabarController?.tabBar.isHidden = false
                        }
                },
                label: label
            )
        } else {
            NavigationLink(
                destination: {
                    destination()
                        .introspectTabBarController { (UITabBarController) in
                            UITabBarController.tabBar.isHidden = true
                            uiTabarController = UITabBarController
                        }.onDisappear {
                            uiTabarController?.tabBar.isHidden = false
                        }
                },
                label: label
            )
        }
    }

}
