import SwiftUI

import XNavigationAndTab

struct EntireView: View, XNavigationAndTabContent {

    var tabInformation: TabInformation { .init(
        title: "전체",
        tabItemImage: Image(systemName: "square.fill")
    )}

    var body: some View {
        Text("전체 화면")
    }
}

struct EntireView_Previews: PreviewProvider {
    static var previews: some View {
        EntireView()
    }
}
