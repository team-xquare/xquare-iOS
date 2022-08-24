import SwiftUI

public struct TabInformation {

    var title: String
    var navigationTitle: String?
    var tabItemText: String?
    var tabItemImage: Image

    public init(
        title: String,
        navigationTitle: String? = nil,
        tabItemText: String? = nil,
        tabItemImage: Image
    ) {
        self.title = title
        self.navigationTitle = navigationTitle
        self.tabItemText = tabItemText
        self.tabItemImage = tabItemImage
    }

}
