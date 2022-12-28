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
            accessToken: viewModel.getAccessToken()
        )
        .navigationTitle("피드")
    }
}
