import SwiftUI

public extension View {
    func onTabSelected(tabIndex: Int, perform: @escaping () -> Void) -> some View {
        self.modifier(OnTabSelectedModifier(tabIndex: tabIndex, doOnTabSelected: perform))
    }
}

struct OnTabSelectedModifier: ViewModifier {

    @Environment(\.tabBarSelection) var tabBarSelection

    var tabIndex: Int
    var doOnTabSelected: () -> Void

    func body(content: Content) -> some View {
        content
            .onChange(of: self.tabBarSelection.wrappedValue) {
                guard $0 == tabIndex else { return }
                self.doOnTabSelected()
            }
    }
}
