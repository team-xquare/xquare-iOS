import SwiftUI

import XNavigationAndTab

struct FeedView: View, XNavigationAndTabContent {

    var tabInformation: TabInformation {
        TabInformation(
            title: "피드",
            tabItemImage: Image(systemName: "square.fill")
        )
    }

    var body: some View {
        Text("피드 화면")
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
