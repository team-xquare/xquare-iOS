import SwiftUI

public typealias TabBarSelection = Int

struct TabBarSelectionKey: EnvironmentKey {
    static let defaultValue: Binding<TabBarSelection> = .constant(TabBarSelection())
}

public extension EnvironmentValues {
    var tabBarSelection: Binding<TabBarSelection> {
        get { return self[TabBarSelectionKey.self] }
        set { self[TabBarSelectionKey.self] = newValue }
    }
}

public extension TabBarSelection {
    mutating func move(index: Int) {
        self = index
    }
}
