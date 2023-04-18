import Foundation
import SwiftUI

struct Routing<Screen: ScreenProtocol, ScreenView: View>: View {
    @Binding var stack: [RouterContext<Screen>]
    @ViewBuilder var buildView: (Screen) -> ScreenView

    public init(
        stack: Binding<[RouterContext<Screen>]>,
        @ViewBuilder buildView: @escaping (Screen) -> ScreenView
    ) {
        self._stack = stack
        self.buildView = buildView
    }

    var body: some View {
        stack
            .enumerated()
            .reversed()
            .reduce(NavigationNode<Screen, ScreenView>.end) { pushedNode, new in
                let (index, screenContext) = new
                return NavigationNode<Screen, ScreenView>.view(
                    buildView(screenContext.screen),
                    context: screenContext,
                    pushing: pushedNode,
                    stack: $stack,
                    index: index
                )
            }
    }
}
