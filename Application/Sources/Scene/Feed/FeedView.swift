import SwiftUI

import XNavigationAndTab

struct FeedView: View, XNavigationAndTabContent {

    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "피드",
            tabItemImage: .feed
        )
    }

    var body: some View {
        Text("피드 화면")
            .navigationTitle("피드")
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
