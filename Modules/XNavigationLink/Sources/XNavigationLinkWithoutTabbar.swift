import SwiftUI

import Introspect

public struct XNavigationLinkWithoutTabBar<Label, Destination>: View where Label: View, Destination: View {

    @State var uiTabarController: UITabBarController?

    var isRootNow: Bool
    var isActive: Binding<Bool>?
    var destination: () -> Destination
    var label: () -> Label

    public init(
        isRootNow: Bool = false,
        @ViewBuilder destination: @escaping () -> Destination,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.isRootNow = isRootNow
        self.destination = destination
        self.label = label
    }

    public init(
        isRootNow: Bool = false,
        isActive: Binding<Bool>,
        @ViewBuilder destination: @escaping () -> Destination,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.isRootNow = isRootNow
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
                            uiTabarController = UITabBarController
                            uiTabarController?.tabBar.isHidden = true
                        }.onChangePresentationMode { isPresented in
                            guard isRootNow && !isPresented else { return }
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
                            uiTabarController = UITabBarController
                            uiTabarController?.tabBar.isHidden = true
                        }.onChangePresentationMode { isPresented in
                            guard isRootNow && !isPresented else { return }
                            uiTabarController?.tabBar.isHidden = false
                        }
                },
                label: label
            )
        }
    }

}
