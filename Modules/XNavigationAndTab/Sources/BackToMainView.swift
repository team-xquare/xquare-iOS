import SwiftUI

public extension View {
    func backToFirstTab(_ isActive: Binding<Bool>) -> some View {
        self.modifier(BbackToFirstTabModifier(needToBack: isActive))
    }
}

struct BbackToFirstTabModifier: ViewModifier {

    @Environment(\.tabBarSelection) var tabBarSelection

    @Binding var needToBack: Bool

    func body(content: Content) -> some View {
        content
            .onChange(of: needToBack) {
                guard $0 == true else { return }
                self.tabBarSelection.wrappedValue = 0
            }
            .onDisappear {
                guard needToBack == true else { return }
                self.tabBarSelection.wrappedValue = 0
                needToBack.toggle()
            }
    }

}
