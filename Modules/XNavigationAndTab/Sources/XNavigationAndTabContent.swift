import SwiftUI

public protocol XNavigationAndTabContent {
    var tabInformation: TabInformation { get }
    var toolBar: Toolbar { get }
}

internal extension XNavigationAndTabContent {
    var toolBar: Toolbar { Toolbar() }
}
