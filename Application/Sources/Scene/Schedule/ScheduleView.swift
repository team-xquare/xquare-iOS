import SwiftUI

import XNavigationAndTab

struct ScheduleView: View, XNavigationAndTabContent {
    @State var showTimeTableView: Bool = true
    let timeTableView: TimeTableView
    let academicScheduleView: AcademicScheduleView
    let scheduleNotification = NotificationCenter.default.publisher(
        for: NSNotification.Name("schedule")
    )
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
        .onTabSelected(tabIndex: 1, perform: {
            academicScheduleView.viewModel.fetchScheduleForMonth()
        })
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
               Text("일정")
                    .sdText(type: .heading6, textColor: .GrayScale.gray900)
                    .padding(.leading, 5)
            }
        }
        .onReceive(scheduleNotification, perform: {
            self.showTimeTableView = $0.userInfo?["isSchedule"] as? Bool ?? false
        })
    }
}
