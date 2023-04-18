import SwiftUI

import XNavigationAndTab
import XWebKit

struct ApplicationView: View, XNavigationAndTabContent {

    @StateObject var viewModel: ApplicationViewModel

    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "신청",
            tabItemImage: .application
        )
    }

    var body: some View {
        XWebKitView(
            urlString: self.viewModel.getWebviewURLString(),
            accessTokenGetter: self.viewModel.getAccessToken
        )
        .navigationTitle("신청")
        .onAppear { viewModel.refreshTokenIfExpired() }
        .onTabSelected(tabIndex: 3) { viewModel.refreshTokenIfExpired() }
    }
}
