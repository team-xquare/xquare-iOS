import SwiftUI

import XNavigationAndTab

struct ScheduleView: View, XNavigationAndTabContent {

    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "일정",
            tabItemImage: Image(systemName: "square.fill")
        )
    }

    var body: some View {
        Text("일정 화면")
            .navigationTitle("일정")
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
