import SwiftUI

import XNavigationAndTab
import XWebKit

struct ApplicationView: View, XNavigationAndTabContent {

    var tabInformation: TabInformation {
        TabInformation(
            title: "신청",
            tabItemImage: Image(systemName: "square.fill")
        )
    }

    var body: some View {
        Text("신청 화면")
    }
}

struct ApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationView()
    }
}
