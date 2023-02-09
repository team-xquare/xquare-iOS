import SwiftUI

import XNavigationAndTab

struct ScheduleView: View, XNavigationAndTabContent {
    @State var showTimeTableView: Bool = true
    let timeTableView: TimeTableView
    let academicScheduleView: AcademicScheduleView

    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "일정",
            tabItemImage: .calendar
        )
    }

    var body: some View {
        VStack(spacing: 0) {
            ScheduleButtonView(
                clickTimeTableButton: { showTimeTableView = true },
                clickAcademicScheduleButton: { showTimeTableView = false },
                showTimeTable: $showTimeTableView
            )
            .padding(.top, 5)
            if showTimeTableView {
                timeTableView
            } else {
                academicScheduleView
            }
            Spacer()
        }
    }
}
