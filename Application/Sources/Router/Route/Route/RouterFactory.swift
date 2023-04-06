import Foundation

import SwiftUI
import XNavigationAndTab

protocol RouterFactory {
    associatedtype Body: View
    associatedtype Screen: ScreenProtocol

    @ViewBuilder func makeBody(for screen: Screen) -> Self.Body
}
