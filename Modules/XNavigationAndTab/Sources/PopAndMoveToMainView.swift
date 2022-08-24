import SwiftUI

public extension View {
    func popAndMoveToMainView(_ isActive: Binding<Bool>) -> some View {
        self.modifier(PopAndMoveToMainViewModifier(needToPopAndMove: isActive))
    }
}

struct PopAndMoveToMainViewModifier: ViewModifier {

    @Binding var needToPopAndMove: Bool

    func body(content: Content) -> some View {
        content
            .onChange(of: needToPopAndMove) {
                guard $0 == true else { return }
                XNavigationAndTab.popToRootView()
            }
            .onDisappear {
                guard needToPopAndMove == true else { return }
                XNavigationAndTab.moveToFirstTab()
                needToPopAndMove.toggle()
            }
    }

}
