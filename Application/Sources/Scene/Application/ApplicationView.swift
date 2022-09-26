import SwiftUI

import XNavigationAndTab
import XWebKit

struct ApplicationView: View, XNavigationAndTabContent {

    @StateObject var viewModel: ApplicationViewModel

    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "신청",
            tabItemImage: Image(systemName: "square.fill")
        )
    }

    var body: some View {
        XWebKitView(
            urlString: self.viewModel.getWebviewURLString(),
            accessToken: self.viewModel.getAccessToken()
        )
        .navigationTitle("신청")
    }
}
