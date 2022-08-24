import SwiftUI

public struct Toolbar {

    var placement: ToolbarItemPlacement
    var contents: [AnyView]

    public init(placement: ToolbarItemPlacement = .navigationBarTrailing, contents: [AnyView] = []) {
        self.placement = placement
        self.contents = contents
    }

}
