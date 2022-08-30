import SwiftUI

public protocol XNavigationAndTabContent {
    var tabInformation: TabInformation { get }
    var toolBar: Toolbar { get }
}

public extension XNavigationAndTabContent {
    var toolBar: Toolbar { Toolbar() }
}
