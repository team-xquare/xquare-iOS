import SwiftUI

import XWebKit

struct WebViewTester: View {

    var body: some View {
        NavigationView {
            XWebKitView(
                urlString: "https://service.xquare.app/xbridge-test",
                accessToken: "Test Token"
            )
            .navigationTitle("Test")
        }
    }
}
