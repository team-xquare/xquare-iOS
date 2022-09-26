import SwiftUI

public struct TabInformation {

    var tabItemText: String
    var tabItemImage: Image
    var backgroundColor: Color

    public init(
        tabItemText: String,
        tabItemImage: Image,
        backgroundColor: Color = Color(UIColor.systemBackground)
    ) {
        self.tabItemText = tabItemText
        self.tabItemImage = tabItemImage
        self.backgroundColor = backgroundColor
    }

}
