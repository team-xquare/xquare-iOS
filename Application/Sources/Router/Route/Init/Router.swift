import Foundation

import SwiftUI
import XNavigationAndTab

enum PresentationType {
    case push
    case fullScreen
    case modal
}

protocol ScreenProtocol {
    var embedInNavigationView: Bool { get }
}

protocol RouterObject: AnyObject {
    associatedtype Screen = ScreenProtocol
    associatedtype Body = View & XNavigationAndTabContent

    func start() -> Body
    func navigateTo(_ screen: Screen)
    func presentSheet(_ screen: Screen)
    func presentFullScreen(_ screen: Screen)
    func dismissLast()
    func popToRoot()
}

struct RouterContext<ScreenType: ScreenProtocol> {
    let screen: ScreenType
    let presentationType: PresentationType
}

class Router<ScreenType, Factory: RouterFactory>: ObservableObject, RouterObject where Factory.Screen == ScreenType {
    @Published private var stack: [RouterContext<ScreenType>] = []
    var factory: Factory

    init(rootScreen: ScreenType, presentationType: PresentationType = .push, factory: Factory) {
        self.stack = [RouterContext(screen: rootScreen, presentationType: presentationType)]
        self.factory = factory
    }

    @ViewBuilder func start() -> some View {
        let bindingScreens = Binding {
            return self.stack
        } set: {
            self.stack = $0
        }

        Routing(stack: bindingScreens) { screen in
            self.factory.makeBody(for: screen)
        }
    }
}

extension Router {
    func navigateTo(_ screen: ScreenType) {
        self.stack.append(.init(screen: screen, presentationType: .push))
    }

    func presentSheet(_ screen: ScreenType) {
        self.stack.append(.init(screen: screen, presentationType: .modal))
    }

    func presentFullScreen(_ screen: ScreenType) {
        self.stack.append(.init(screen: screen, presentationType: .fullScreen))
    }

    func dismissLast() {
        self.stack.removeLast()
    }

    func popToRoot() {
        self.stack.removeLast(self.stack.count - 1)
    }
}
