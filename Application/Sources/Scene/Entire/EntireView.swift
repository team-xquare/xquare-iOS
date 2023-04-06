import SwiftUI

import XNavigationAndTab

struct EntireView: View, XNavigationAndTabContent {

    var pointHistoryView: PointHistoryView
    var myPageView: MyPageView
    var bugReportView: BugReportView
    var selfStudyTeacherView: SelfStudyTeacherView
    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "전체",
            tabItemImage: .entire
        )
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 27) {
                TopServiceMenuView(
                    pointHistoryView: pointHistoryView,
                    myPageView: myPageView,
                    bugReportView: bugReportView
                )
                ServiceSectionView(
                    headerText: "학교",
                    services: [
                        (text: "오늘의 자습감독 선생님", destination: selfStudyTeacherView)
                    ]
                )
            }
        }
        .navigationTitle("전체")
    }
}
