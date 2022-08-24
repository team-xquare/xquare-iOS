import SwiftUI

public protocol XTabbarContent {
    var tabInformation: TabInformation { get }
    var toolBar: Toolbar { get }
}

internal extension XTabbarContent {
    var toolBar: Toolbar { Toolbar() }
}
