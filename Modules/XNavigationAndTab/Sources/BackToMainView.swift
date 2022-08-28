import SwiftUI

public extension View {
    func backToMainViewMainView(_ isActive: Binding<Bool>) -> some View {
        self.modifier(BackToMainViewModifier(needToBack: isActive))
    }
}

struct BackToMainViewModifier: ViewModifier {

    @Binding var needToBack: Bool

    func body(content: Content) -> some View {
        content
            .onChange(of: needToBack) {
                guard $0 == true else { return }
                XNavigationAndTabUtil.popToRootView()
                XNavigationAndTabUtil.moveToFirstTab()
            }
            .onDisappear {
                guard needToBack == true else { return }
                XNavigationAndTabUtil.moveToFirstTab()
                needToBack.toggle()
            }
    }

}
