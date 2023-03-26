import SwiftUI

import XNavigationAndTab
import XWebKit

struct FeedView: View, XNavigationAndTabContent {

    @StateObject var viewModel: FeedViewModel

    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "피드",
            tabItemImage: .feed
        )
    }

    var body: some View {
        XWebKitView(
            urlString: viewModel.getWebviewURLString(),
            accessTokenGetter: viewModel.getAccessToken
        )
        .navigationTitle("피드")
        .onAppear { viewModel.refreshTokenIfExpired() }
        .onTabSelected(tabIndex: 2) { viewModel.refreshTokenIfExpired() }
    }
}
