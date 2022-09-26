import SwiftUI

import XNavigationAndTab

struct EntireView: View, XNavigationAndTabContent {

    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "전체",
            tabItemImage: Image(systemName: "square.fill")
        )
    }

    var body: some View {
        Text("전체 화면")
            .navigationTitle("전체")
    }
}

struct EntireView_Previews: PreviewProvider {
    static var previews: some View {
        EntireView()
    }
}
