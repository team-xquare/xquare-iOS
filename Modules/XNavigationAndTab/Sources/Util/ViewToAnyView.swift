import SwiftUI

public extension View {
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
